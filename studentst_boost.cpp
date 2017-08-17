#include <boost/python.hpp>
#include <boost/math/distributions/students_t.hpp>
using boost::math::students_t_distribution;
#include <iostream>

typedef students_t_distribution<double> students_t_double;

double pdf(double x, double dof){
    students_t_double norm1(dof);
    return pdf(norm1, x);
}

double cpdf(double x, double dof){
    students_t_double norm1(dof);
    return cdf(norm1, x);
}

class StudentsT {
    students_t_double _inner = students_t_double(1);
    double _scale;
    double _shape;

    public:
    StudentsT(double dof, double scale, double shape)
        {
            _inner = students_t_double(dof);
            _scale = scale;
            _shape = shape;
        }
    double xpdf(double x){
        return pdf(_inner, (x - _scale) / _shape);
    }
    double xcdf(double x){
        return cdf(_inner, (x - _scale) / _shape);
    }
    double xppf(double x){
        return quantile(_inner, (x - _scale) / _shape);
    }
};

BOOST_PYTHON_MODULE(studentst_boost)
{
    using namespace boost::python;
    def("pdf", pdf);
    def("cdf", cpdf);
    class_<StudentsT>("StudentsT", init<double,double,double>())
        .def("pdf", &StudentsT::xpdf)
        .def("cdf", &StudentsT::xcdf)
        .def("ppf", &StudentsT::xppf)
    ;
}
