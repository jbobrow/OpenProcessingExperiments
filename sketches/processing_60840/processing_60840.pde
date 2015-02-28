
//globals for text links
float gx = 100;
float gy = 100;
float gw = 35;
float gh = 10;

click welcome;
click about;
click contactUs;
click products;
click blog;
click gallery;

//globals for circles
//boolean button = false;
//int x;
//int y;
//int w;
//int h;



void setup() {
  size(800,600);
  smooth();

  
  //initialize clickable link text
  welcome = new click(350,350,162,36);
  about = new click(550,225,119,36);
  contactUs = new click (550,450,150,36);
  products = new click (350,100,166,36);
  blog = new click (150,240,75,45);
  gallery = new click (200,500,123,45);
  
  
}


void draw() {
   background(144);
  
  welcome.display("welcome.svg");
  about.display("about.svg");
  contactUs.display("contactUs.svg");
  products.display("products.svg");
  blog.display("blog.svg");
  gallery.display("gallery.svg");
 
//println(welcome.buttonPressed());

circle1();
  circle2();
  circle3();
  circle4();
  circle5();
  circle6();
 
}



void mousePressed() {

  if(welcome.buttonPressed()) { 
    link("http://www.heidiswapp.com/");
       //cursor(HAND);
  }
  if(about.buttonPressed()) {
    link("http://www.facebook.com/HeidiSwapp");
  }
  if(contactUs.buttonPressed()) {
    link("http://www.apple.com/contact/");
  }
  if(products.buttonPressed()) {
    link("http://www.adobe.com/products/discount-software-coupons.html?promoid=JOLJG");
  }
  if(blog.buttonPressed()) {
    link("http://www.truesuccessblogs.com/");
  }
  if(gallery.buttonPressed()) {
    link("http://www.123rf.com/stock-photo/");
  }

}

//circle behind welcome
void circle1(){
   ellipseMode(CENTER);
   noStroke();
   fill(255,8,148,99);
    //fill(232,163,178,90);  //  ctmh blush
    ellipse(450,400,300,300);
//    if(button){
//      fill(244,234,150,99);
//    } else {
//      fill(255,8,148,99);
    }
    

//    void mouseOut() {
//    fill(255,8,148,99);
//
//}


//circle behind about
void circle2(){
   ellipseMode(CENTER);
   noStroke();
   fill(255,181,202,99);
    //fill(249,207,221,99);  //ctmh baby pink
    ellipse(600,250,225,225);
//     if(button){
//      fill(244,234,150,99);
//    } else {
//      fill(255,181,202,99);
//    }
}

//circle behind products
void circle3(){
   ellipseMode(CENTER);
   noStroke();
   fill(255,145,167,99);
    //fill(255,139,164,95);  //ctmh pink carnation
    ellipse(350,200,400,400);  
}

//circle behind blog
void circle4(){
   ellipseMode(CENTER);
   noStroke();
   fill(245,240,186,99);
    //fill(230,101,166,95);  //ctmh watermelon
    ellipse(138,300,275,275);  
}

//circle behind gallery
void circle5(){
   ellipseMode(CENTER);
   noStroke();
   fill(255,94,159,99);
    //fill(212,104,126,95);  //ctmh hollyhock
    ellipse(200,500,200,200);  
}

//circle behind contact us
void circle6(){
   ellipseMode(CENTER);
   noStroke();
   fill(249,207,221,99);  //ctmh baby pink
   // fill(243,141,188,95);  //ctmh bubblegum
    ellipse(600,500,150,150);  
}

void mouseOver() {
    fill(244,234,150,99);
}

