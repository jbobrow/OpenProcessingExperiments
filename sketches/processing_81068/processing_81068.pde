
int homeX = -2;
int homeY = -2;
int homeX1 = 28;
int homeY1 =28;
int fwdX = 315;
int fwdY = 455;
int fwdX1 = 340;
int fwdY1 = 480;
int backX = 0;
int backY = 455;
int backY1 = 480;
int backX1 = 25;//These are the various button coordinates that is needed
boolean menu = true;
boolean weatherbutton = false;
int coord = 70;
String data[] = loadStrings("http://www.weatherzone.com.au/vic/central/st-andrews");
PFont font;
PImage bg, mbtn1, mbtn3, home, fwd, back;//The 6 images needed. Note we wont use the club button - not enough time.
String[] c1_url = { 
  "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/1.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/2.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/3.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/4.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/5.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/6.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/7.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/8.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/9.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/10.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/11.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/12.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/13.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/14.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/15.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/16.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/17.jpg", "http://www.standrews.org.uk/App_Themes/SALT/graphics/scorecard/oldcourse/18.jpg"
}; //This is an array of URLS of the images
PImage[] img;
int x = 0; //This is the variable used for the image. So if x = 1, then the course will go to number 2.(arrays remember)
void setup() {
  font = loadFont("EurostileRegular-25.vlw");
  textFont(font, 18);
  size(340, 480);
  fwd = loadImage("forward_btn.png");
  back = loadImage("back_btn.png");
  home = loadImage("home_btn.png");
  bg = loadImage("golfappbg.jpg");
  mbtn1 = loadImage("menu_btn_maps.png");
  mbtn3 = loadImage("menu_btn_weather.png");
  img = new PImage[c1_url.length]; //Getting the images through the URL strings
  for (int i = 0; i < c1_url.length; i++) {//The loop to get multiple images loaded.
    img[i] = loadImage(c1_url[i]);
  }
}
void draw() {
  image(img[x], 0, -35);//Img[x] is the course image which is determined by the mousePressed function bellow
  image(fwd, 315, 455);//Other images:
  image(back, -2, 455);
  image(home, -2, -2);
  fwdX=315;
  backX=0;
  if (menu == true){ //Drawing the menu
  image(bg,0,0);
  image(mbtn1,70,320);
  image(mbtn3,70,380);
  fwdX=1000;
  backX=1000; //Taking the forward/back buttons off-screen
  }
  if (weatherbutton == true){   //Drawing the weather
    image(bg,0,0);
    image(home, -2, -2);
       for (int j=0; j<data.length; j++) {
String[] bit = split(data[j], ",");
  }
  //println(data[696]);
  String weather = data[696];
  text(weather, 80 ,300, 200, 300); //Position of the Weather Text Box  
  }
}
//Instead of using a million if statements what i've done is put the images into an array. So when i call an image by number a course will come up.
// x represents the course variable. So when i press the fwd button then it will increment and move to the next image
void mousePressed() {
  if (mouseX > fwdX && mouseX < fwdX1 && mouseY > fwdY && mouseY < fwdY1) {
    if (x <img.length-1) {//This line will stop the maps crashing by going too far.      
      loop();
      menu = false;
      x++;  
    }
  }
 if (mouseX > backX && mouseX < backX1 && mouseY > backY && mouseY < backY1) { //Coordinates used for the back button. 
    loop();
    menu = false;
      x--;
      if (x<1){
        x=0;
      }
    }
if (mouseX > coord && mouseX < 270 && mouseY > 320 && mouseY < 370){
  menu = false;
  coord = 1000;
  }
 if (mouseX > homeX && mouseX < homeX1 && mouseY > homeY && mouseY < homeY1){ 
   menu = true;
   weatherbutton = false;
   coord = 70;
   draw();
   x=0; 
 }
 if (mouseX > coord && mouseX < 270 && mouseY > 380 && mouseY < 430){
  weatherbutton = true;
  draw();
 }
}
 



