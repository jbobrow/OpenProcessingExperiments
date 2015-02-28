
int[] answers1; // do you prefer cake over pie?
int[] answers2; // do you like candy?
int[] age; // age
int x,y,d;
PFont font;


void setup (){
  size(500,500);
  smooth();
  background(255);
  fill(215);
  noStroke();
  ellipse(width/2,height/2,400,400);
  smooth();
  answers1 = int(loadStrings("cakepie.txt"));
  answers2 = int(loadStrings("candy.txt"));
  age = int(loadStrings("age.txt"));
  font = loadFont("GothamRounded-Bold-32.vlw");
  fill(0);
  textFont(font, 20);
  text("PIE",105,38);
  text("CAKE",350,38);
}

void draw(){
    
   int yes = 0;
   int no = 0;
  for (int i=0; i<answers1.length; i++){
    if (answers1[i]==1) //cake, yes
    {
      x=int(random(300,400));
      y=int(random(100,400));
       d=int((age[i]));
      fill(222,232,240);
            strokeWeight(.5);

      stroke(255);
      line(250,250,x,y);
      circleC(x,y,d);
      

    }
    else if (answers1[i]==0) //pie, no
    {
      x=int(random(100,200));
      y=int(random(100,400));
      d=int((age[i]*1.5));
      fill(143,39,69);
      strokeWeight(.75);
      stroke(255);
      line(250,250,x,y);
      circleC(x,y,d);
    }
   } 
    noLoop();
   
}

void circleC(float x, float y, float d){
  pushMatrix();
  noStroke();
  ellipse(x,y,d,d);
  popMatrix();
}



