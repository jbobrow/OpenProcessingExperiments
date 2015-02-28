
//Final Project
//An interactive pattern of ice cream cones creeated using data collected on 
//how much ice cream was consumed daily from 1906 to 2006.
//Data collected from http://future.aae.wisc.edu/data/annual_values/by_area/2252?tab=sales&period=complete
//Sound library made from http://code.compartmental.net/tools/minim/

//imports the minim sound library program
import ddf.minim.*;

//makes the objects into array
Cone [] cones;

//introduces the sound files
Minim minim;
AudioSnippet key1;
AudioSnippet key2;
AudioSnippet key3;
AudioSnippet key4;
AudioSnippet key5;

int opacity, teal;
float x, y,ySize;
PImage cone;
String[] data;

void setup(){
  size(800,600);
  frameRate(5);
  smooth();
  colorMode(HSB,100,100,100);
  readCones();
  cone = loadImage("cone.png");
  teal = 43;
  
  //loads sound files
  minim = new Minim(this);
  key1 = minim.loadSnippet("key1.mp3");
  key2 = minim.loadSnippet("key2.mp3");
  key3 = minim.loadSnippet("key3.mp3");
  key4 = minim.loadSnippet("key4.mp3");
  key5 = minim.loadSnippet("key5.mp3");

  
}
//reads the data from the text file and transfers it into numbers for the objects
//also populates array
void readCones(){
  data = loadStrings("cones.csv");
  cones = new Cone[data.length];
  for(int i=0;i<data.length;i++){
    String[] splitData = split(data[i],",");
    float z = parseFloat(splitData[1]);
    x = i;
    y = parseFloat(splitData[1]);
    ySize = y;
    cones[i] = new Cone(x,random(height),y,ySize,ySize);
  }
}

void draw(){
  background(#90CFEA);
  for(int i=0;i<cones.length;i++){
    cones[i].display();
    cones[i].interact();
    //plays back sound
    if(dist(mouseX,mouseY,cones[i].xCone*10,cones[i].yCone)<20 && i%2==0){
      key1.play(0);
    }
    if(dist(mouseX,mouseY,cones[i].xCone*10,cones[i].yCone)<20 && i%3==0){
      key2.play(0);
    }
    if(dist(mouseX,mouseY,cones[i].xCone*10,cones[i].yCone)<20 && i%4==0){
      key3.play(0);
    }
    if(dist(mouseX,mouseY,cones[i].xCone*10,cones[i].yCone)<20 && i%5==0){
      key4.play(0);
    }
    if(dist(mouseX,mouseY,cones[i].xCone*10,cones[i].yCone)<20 && i%7==0){
      key5.play(0);
    }
    //creates the line pattern
    if(i%2==0 && i>0){
      stroke(78,48,teal+20);
      line(cones[i].xCone*10,cones[i].yCone,cones[i-1].xCone*10,cones[i-1].yCone);
    }
    if(i%3==0 && i<cones.length-7){
      stroke(68,48,teal);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+4].xCone*10,cones[i+4].yCone);
      stroke(68,48,teal+20);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+5].xCone*10,cones[i+5].yCone);
      stroke(68,48,teal+40);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+6].xCone*10,cones[i+6].yCone);
      stroke(68,48,teal+70);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+7].xCone*10,cones[i+7].yCone);
    }
    if(i%6==0 && i<cones.length-9){
      stroke(58,48,teal);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+6].xCone*10,cones[i+6].yCone);
      stroke(58,48,teal+20);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+7].xCone*10,cones[i+7].yCone);
      stroke(58,48,teal+40);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+8].xCone*10,cones[i+8].yCone);
      stroke(58,48,teal+70);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+9].xCone*10,cones[i+9].yCone);
    }
    if(i%5==0 && i<cones.length-8){
      stroke(60,48,teal);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+5].xCone*10,cones[i+5].yCone);
      stroke(60,48,teal+20);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+6].xCone*10,cones[i+6].yCone);
      stroke(60,48,teal+40);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+7].xCone*10,cones[i+7].yCone);
      stroke(60,48,teal+70);
      line(cones[i].xCone*10,cones[i].yCone,cones[i+8].xCone*10,cones[i+8].yCone);
    }
  }
}


//creates the objects class
class Cone{
  float xCone; float yCone; float ConeColor; float size1; float size2;
  int s; float z;
  
  Cone(float xCone1, float yCone1, float ConeColor1, float size11, float size21){
    xCone = xCone1;
    yCone = yCone1;
    ConeColor = ConeColor1;
    size1 = size11;
    size2 = size21;
  }
  //makes the change in opacity
    void interact(){
    if(dist(mouseX,mouseY,xCone*10,yCone)<20){
      s++; 
      opacity = 95*s;
      
      if(s == 6){
        s=0;
      }
     
    }else{
      s = 0;
    }
  }
  //what the objects look like
  void display(){
    imageMode(CENTER);
    tint(ConeColor*5,50,100,opacity);
    //float y = height - yCone*10);
    map(x,0,data.length,0,width);
    image(cone,xCone*10,yCone,size1*5,size2*5);
  }  
}
//stops the playback of sound files
void stop(){
  key1.close();
  key2.close();
  key3.close();
  key4.close();
  key5.close();
  minim.stop();
  super.stop();
}

