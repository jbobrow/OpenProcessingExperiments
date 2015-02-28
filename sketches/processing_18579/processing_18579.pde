
Night night;
Day monday, tuesday, wednesday;

int counter=20;
boolean Day=true;
int reaction=0;

// color values for blue, orange, tan, and green

int br=196; int bg=233; int bb=251;
int or=241; int og=90; int ob=41;
int tr=252; int tg=240; int tb=155;
int gr=141; int gg=198; int gb=63;
 
int blueColor = color(br,bg,bb);
int orangeColor = color(or,og,ob);
int tanColor = color(tr,tg,tb);
int greenColor = color(gr,gg,gb);
int darkorangeColor = color(187, 70, 29);
int blackColor = color(0);
int whiteColor = color(255);
 
void setup() {
  size(200,200);
  smooth();
  //first number is moon size, second is moon phase
  night = new Night(30, 160);
  //speed, y location, size
  monday = new Day(1, 19, 22);
  tuesday = new Day(2, 50, 15);
  wednesday = new Day(1.5, 100, 25);
}
     
void draw() {
  frameRate(60);
  background(blueColor);
  
  if (Day==false){
  night.display();
  }else{
  monday.display();
  monday.move();
  tuesday.display();
  tuesday.move();
  wednesday.display();
  wednesday.move();
  }
  
  fox();
  whiskers();
  time();

}


