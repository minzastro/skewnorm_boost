#include <boost/python.hpp>
#include <boost/math/distributions/skew_normal.hpp>
using boost::math::skew_normal_distribution;
#include <iostream>

typedef skew_normal_distribution<double> skew_normal_double;

double pdf(double x, double loc, double scale, double shape){
    skew_normal_double norm1(loc, scale, shape);
    return pdf(norm1, x);
}

double cpdf(double x, double loc, double scale, double shape){
    skew_normal_double norm1(loc, scale, shape);
    return cdf(norm1, x);
}

class SkewNorm {
    skew_normal_double _inner;

    public:
    SkewNorm(double loc,double scale, double shape)
        {
            _inner = skew_normal_double(loc, scale, shape);
        }
    double xpdf(double x){
        return pdf(_inner, x);
    }
    double xcdf(double x){
        return cdf(_inner, x);
    }
    double xppf(double x){
        return quantile(_inner, x);
    }
};

BOOST_PYTHON_MODULE(skewnorm_boost)
{
    using namespace boost::python;
    def("pdf", pdf);
    def("cdf", cpdf);
    class_<SkewNorm>("SkewNorm", init<double,double,double>())
        .def("pdf", &SkewNorm::xpdf)
        .def("cdf", &SkewNorm::xcdf)
        .def("ppf", &SkewNorm::xppf)
    ;
}
