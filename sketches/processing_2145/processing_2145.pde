
PImage[] photo=new PImage[31];
float y=-150;
float a,b,c,q=0;
float z=-230;

void setup(){
  size(720,480,P3D);
  colorMode(HSB,100);
  imageMode(CENTER);
  noStroke();
  frameRate(30);
    
  for(int i=0;i<31;i++){
    photo[i]=loadImage(i+".jpg");
  }
}


void draw(){
  background(0);
  
  a+=1.5;
  b+=1.45;
  c+=1.5;
  q=20*sin(radians(c));

  camera(a, 0.0+q, 180.0-b,
         a, 0.0+q, -5000.0-b,
         0.0, 1.0, 0.0);


  
  for(int i=0;i<31;i++){
    image(photo[i],-30,0,photo[i].width/3.5,photo[i].height/3.5);
    translate(150,0,-150);
//    if(i>31) i=0;
  }
//  saveFrame("march_####.tiff");
}

