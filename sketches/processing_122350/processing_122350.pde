
//this sketch will produce a christmas card based on the string below
String str = "Merry Christmas";

//wee will have an array of snow flakes one for each character
Flake[] f;

void setup() {
  smooth();//nice curves
  textFont(createFont("Courier", 24));  //set courier as the text fonts of  size 24pt

  size(148*5, 105*5);  // this is the proportion of a a6 card scaled up to sn appropriate size

  background(255);  //fill the background with white
  
  colorMode(HSB, 100); //using a hue saturation and brighness colour space with 100 diffrent levels of each
  int[] charsAsASCII = int(str.toCharArray());  //convert our String to an array of ASCII values
  f = new Flake[str.length()];  // instansiate an array of Flake objects the with one for each char
  float spacing = 70; // this dictates how spread out the flakes are 

  float xt=((width-5*spacing)/2)-(spacing/2); //this centers the text
  float yt=height/3; //this is our starting y postion for the text

    //for every flake
  for (int i=0;i<f.length;i++) {
  
    if (charsAsASCII[i] == 32) { //if we have a space 
      yt+=height/4;    //move on to the next line
      xt=((width-9*spacing)/2)-(spacing/2); //and figure out how to center the teh second line of text
      f[i]= new Flake(xt, yt, 0, 0); //this is the space char so just set it as as having no size as we dont want to see it
    }
    else {
      // if the char is not a space we beed to set up a flake
      //figure the size by maping hte ASCI range(122-65) so a size range (2-4.3)
      float size = map(charsAsASCII[i], 122, 65, 2, 4.3); 
      //figure out the colour by mapping the ascci range to the availabel hues (0-100)
      // and set the colour with 100 brighntess, 80 saturation and only 20 opacity 
      color flakeColor = color(map(charsAsASCII[i], 122, 65, 0, 100), 100, 80, 20);
      xt+=spacing; // step on the x position

      colorMode(HSB, 100); // make sure we are in the correct colour space
      // set teh fill colour wiht 100 opacity
      fill(color(map(charsAsASCII[i], 122, 65, 0, 100), 100, 80, 100)); 
      text(str.charAt(i), xt-8, yt+65); //render the chracter
      noFill();//turn of object fill
      // instansiate our new flake wiht all the paramaters we have produced
      f[i]= new Flake(xt, yt, size, flakeColor); 
    }
  }
}

//when you click step through all flakes and render them
void mousePressed(){
  for (int i=0;i<f.length;i++) {
    f[i].drawFlake();
  }
 
}

//when a key is pressed prduce an image
int i=0;
void keyPressed(){
 save("card"+(i++)+".tif"); 
}

void draw() {
}
//our flake class
class Flake {

  //atribute of our flake, position, size and colour
  float x=0;
  float y=0;
  float sizeOfFlake=0;
  color c;

  //constructor to set up a new flake
  public Flake(float x, float y, float s, color c) {
    this.x=x;
    this.y=y;
    sizeOfFlake=s;
    this.c=c;
  }

  //the method that draws our snow flake
  void drawFlake() {
    pushMatrix(); //we are doing 2D transforms so lets preserve the current state of the matrice
    translate(x, y); //transalte to the center of our snow flake 
    int a=360/6; // the size of a step in deg for drawing 6 limbs

    //for each limb of the snowflake
    for (int i=0;i<6;i++) {
      float linInc = 0.01;
      colorMode(HSB, 100);
      stroke(c);
      strokeWeight(0.1);
      pushMatrix();
      float lineLen = sizeOfFlake/2;

      //for 5 times teh size of a snowflake
      for (int ii=0;ii<sizeOfFlake*5;ii++) {
        println(ii);
        //map the stroke wight, heavy in the center and lighter as we move out
        strokeWeight(map(ii, 0, sizeOfFlake*5, 1, 0.1));
        int f=2; // this is the length of the tiny angled lines that make up the limb

        //draw a bunch of tiny fethery lines randomised in lenght 
        line(0, 0, -lineLen+random(-f, f), -lineLen+random(-f, f));
        line(0, 0, -lineLen+random(-f, f), lineLen+random(-f, f));

        line(random(-f, f), random(-f, f), -lineLen, -lineLen);
        line(random(-f, f), random(-f, f), -lineLen, lineLen);        

        line(random(-f, f), random(-f, f), lineLen+random(-f, f), lineLen+random(-f, f));
        line(random(-f, f), random(-f, f), lineLen+random(-f, f), -lineLen+random(-f, f));

        //increment the size of our lines
        lineLen+=linInc;
        linInc+=0.03;


        translate(sizeOfFlake/2, 0);
      }
      popMatrix();
      rotate( radians((a)));
    }
    popMatrix();
  }
}
