
PImage img;
ArrayList <Hujan> h;
int[] ypoint;
int jarak = 10;
boolean run = false;

void setup(){
  h = new ArrayList<Hujan>();
  img = loadImage("logo11w.png");

  //int newsize = 300;
  //img.resize(newsize, newsize*img.height/img.width);
  
  //size(img.width, img.height);
  size(538, 190);
  
  ypoint = new int[538/jarak];
  for(int i = 0; i < ypoint.length; i++)ypoint[i] = 0;
  
  background(255);
  
  img.loadPixels();
  textSize(30*width/500);
  textAlign(CENTER);
  //println((img.width*img.height)/jarak);
  
}//setup

void draw(){
  background(255);
  fill(0);
  if(!run)text("CLICK HERE", width/2, height/2);
  
  if(run){
    int selected = int(random(0,(img.width)/jarak));
    int yact = img.height - ypoint[selected]*jarak - 1;
    if(yact > 0){
      h.add(new Hujan(selected*jarak,yact,img.pixels[selected*jarak + yact*img.width]));
      ypoint[selected]++;
    }//if
    
    for(int i = h.size()-1; i >= 0; i--){
      h.get(i).display();
      //if(!h.get(i).status)h.remove(i);
    }//for
  }//if run

}//draw

void mousePressed(){
  
    run = true;
    for(int i = h.size()-1; i >= 0; i--){
      h.remove(i);
    }//for
    
    ypoint = new int[538/jarak];
    for(int i = 0; i < ypoint.length; i++)ypoint[i] = 0;
    
  background(255);
}

class Hujan{
  float desx, desy;
  float posx, posy;
  float speed;
  int warna;
  boolean status = true;
  
  Hujan(int ix, int iy, int w){
    desx = ix;
    desy = iy;
    posx = ix;
    posy = 0;
    speed = 5;
    warna = w;
  }//hujan constructor
  
  void display(){
    if(desy > posy){
      posy = posy + speed;
      speed+= 0.1;
    }//if
    else{
      posy = desy;
      status = false;
    }//else
    noStroke();
    fill(warna);
    ellipse(posx,posy,jarak,jarak);
  }//display

}//hujan


