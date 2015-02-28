
//globals for flower
PShape flower;
PShape stem;
float xpos = 0;
float ypos = 0;
float flowerRot = 0;


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
  frameRate(10);
  
  //initialize clickable link text
  welcome = new click(350,350,162,36);
  about = new click(550,225,119,36);
  contactUs = new click (550,460,150,36);
  products = new click (350,100,166,36);
  blog = new click (150,240,75,45);
  gallery = new click (200,500,123,45);
  
  welcome.load("welcome.svg");
  about.load("about.svg");
  contactUs.load("contactUs.svg");
  products.load("products.svg");
  blog.load("blog.svg");
  gallery.load("gallery.svg");
  
  flower = loadShape("flower.svg");
  stem = loadShape("stem.svg");
}


void draw() {
   background(144);
   //display stem of flower on right
   shape(stem,550,370,224,244);
  
  welcome.display();
  about.display();
  contactUs.display();
  products.display();
  blog.display();
  gallery.display();
 
//println(welcome.buttonPressed());

  circle1();
  circle2();
  circle3();
  circle4();
  circle5();
  circle6();
 if(welcome.buttonPressed()||about.buttonPressed()||contactUs.buttonPressed()||products.buttonPressed()||blog.buttonPressed()||gallery.buttonPressed()){
    cursor(HAND);
 }else{
   cursor(ARROW);
 }
 
 //display flower and rotate 
 shape(flower,600,225,210,237);
 flower.rotate(radians(flowerRot));
  flowerRot=flowerRot+.01;
 
}



void mousePressed() {

  if(welcome.buttonPressed()) { 
    link("http://www.heidiswapp.com/");
       
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
    ellipse(350,200,400,400);  
}

//circle behind blog
void circle4(){
   ellipseMode(CENTER);
   noStroke();
   fill(245,240,186,99);
    ellipse(138,300,275,275);  
}

//circle behind gallery
void circle5(){
   ellipseMode(CENTER);
   noStroke();
   fill(255,94,159,99);
    ellipse(200,500,200,200);  
}

//circle behind contact us
void circle6(){
   ellipseMode(CENTER);
   noStroke();
   fill(249,207,221,99);  //ctmh baby pink
    ellipse(600,500,150,150);  
}

void mouseOver() {
    fill(244,234,150,99);
}


class click {
  float gx;
  float gy;
  float gw;
  float gh;
  PShape imgName;

  
  click(float _gx, float _gy, float _gw, float _gh){
    gx = _gx;
    gy = _gy;
    gw = _gw;
    gh = _gh;
    
  }
  
void load(String imgString){
   imgName=loadShape(imgString);
   imgName.disableStyle();
}
  
void display(){

   noStroke();
      if(buttonPressed()){
        
      fill(250,0,246);
    } else {
      
      fill(0);
    }
    shape(imgName, gx, gy, gw, gh);
}
  
Boolean buttonPressed(){
   if(mouseX > gx-gw && mouseX < gx + gw && mouseY > gy-gh && mouseY < gy+gh) {
     return true;
   
   }else{
     return false;
 
   }
}
}

