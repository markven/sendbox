#include   "opencv2/core/core.hpp"
#include  "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"   //required for median blur function
 
int main(){
  
 cv::Mat image = cv::imread("test.jpg");
 if(!image.data){
 //problem!!
 }
 cv::namedWindow("Window1");
 cv::namedWindow("Window2");
 
 //this will will be mofified by median blur
 cv::Mat copyimg(image.clone());
 
 cv::medianBlur(image, copyimg, 21);
 cv::imshow("Window1", image);
 cv::imshow("Window2",copyimg);
 
 cv::waitKey(50000);
 
 return 1;
}