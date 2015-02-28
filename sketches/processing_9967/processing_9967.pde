
//an example of controlP5 library application
//for BrainCityLab 2010
import controlP5.*;//this imports the library, first you need to download it from here: http://www.sojamo.de/libraries/controlP5/ 
ControlP5 controlP5;

G_element[] gE;//array of ellipses on the screen
int gCount=11;//size of the above array

void setup(){
  size(700,700);
  smooth();
  controlP5 = new ControlP5(this);
  
  gE=new G_element[gCount];
  for(int i=0; i<gCount;i++){
    gE[i]=new G_element(new PVector(random(150,width-150),random(150,height-150)),random(10,100),color(random(255),random(255),random(255)),i);
     //creating all the new elements as instances of G_element class  
  }
}

void draw(){
  background(100); 
  gSystem();//running the thing  
}

void keyTyped(){//pressing a key sets it up differently
  for(int i=0; i<gCount;i++){
    controlP5.remove("id_"+i);//removing old sliders
    gE[i]=new G_element(new PVector(random(150,width-150),random(150,height-150)),random(10,100),color(random(255),random(255),random(255)),i);   
  }  
}


