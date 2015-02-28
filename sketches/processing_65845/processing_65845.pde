
int[] answers1; // do you prefer cake over pie?
int[] answers2; // do you like candy?
int[] age; // age
int x,y,d;
PFont font;

void setup (){
  size(500,500);
  smooth();
  background(200);
 
  smooth();
  answers1 = int(loadStrings("cakepie.txt"));
  answers2 = int(loadStrings("candy.txt"));
  age = int(loadStrings("age.txt"));
  font = loadFont("GothamRounded-Bold-32.vlw");
  fill(255);
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
      if(answers2[i]==1){
        strokeWeight(2);
      }
     yarc(age[i]);
     
      

    }
    
    else if (answers1[i]==0) //pie, no
    {
      if(answers2[i]==1){
        strokeWeight(2);
      }
     xarc(age[i]);
     
    
    }
    }
  
    noLoop();
    
}

void yarc(float x){
  strokeWeight(.75);
  stroke(200,232,240);
  noFill();
  arc(250, 250, x*8, x*8, PI+HALF_PI, TWO_PI+HALF_PI);
 
}

void xarc(float x){
  strokeWeight(.75);
  stroke(143,39,69);
  noFill();
  arc(250, 250, x*8, x*8, HALF_PI,PI+HALF_PI);
  
}



