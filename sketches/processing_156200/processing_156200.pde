
PImage photo1;
PImage photo2;
PImage photo3;
float b=50;
float c =300;
float w;
float h;
float G=255;
float B=255;
float R=255;


boolean a=false;

void setup(){
  size(800,800);
  background(255,255,255);

  photo1 = loadImage("image1.gif");
  photo2 = loadImage("image2.jpeg");
  photo3 = loadImage("image3.jpg");
}

void draw(){
        background(255,255,255);
        float t = sin(millis()*0.007);
        w=t*3+108;
        h=t*3+117;
    if(mouseX>=width/2 && mouseY<= height/2){
      tint(R,G,B);
      G--;
      B--;
      image(photo3,b,c,150,130);
      if(c<height){
      c+=10;}
      else{
      c=random(20,500);
      b=random(100,700);
      }
    }else if(mouseX>=width/2 && mouseY>height/2){
            tint(R,G,B);
      G++;
      B++;
      image(photo3,b,c,150,130);
      if(c>0){
      c-=10;
    }else{
    c=random(20,500);
      b=random(100,700);}
    }
    
  if (mouseX>=200 &&mouseX<=390 &&mouseY>=100 &&mouseY<=280){
    image(photo1,200,100,190,180);
    if(mousePressed){    
      background(255,255,255);
      image(photo2,500,500,w,h);
    }
  }

}


