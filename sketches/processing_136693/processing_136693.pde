
float eyesize[] = {60,70};
float pupil[] = {10,36};
float middle[] = {25,100,75};
float eyeColor1[] = {200,170,140};
float eyeColor2[] = {0,30,100};
float eyeColor3[] = {39,255,255};
float eyeColor4[] = {100,70,140};
float back[] = {255,40,0};
   eyeball EyeBall1;                      
  
void setup(){
   background(0);
  frameRate(10);
  size(100,100);
}
  
void draw(){
  background(random(back[0],back[2]));
EyeBall1 = new eyeball(
    random(eyesize[0],eyesize[1]),
    random(pupil[0],pupil[1]),
    random(middle[0],middle[2]),
    random(eyeColor1[0],eyeColor1[2]),
    random(eyeColor2[0],eyeColor2[2]),
    random(eyeColor3[0],eyeColor3[2]),
    random(eyeColor4[0],eyeColor4[2])
   );
  EyeBall1.run();
}
  
class eyeball{
  float eyesize;
  float pupil;
  float middle;
  float eyeColor1;
  float eyeColor2;
  float eyeColor3;
  float eyeColor4;
  eyeball(float _eyesize, float _pupil, float _middle, float _eyeColor1, float _eyeColor2, float _eyeColor3, float _eyeColor4){
  eyesize = _eyesize;
  pupil = _pupil;
  middle = _middle;
  eyeColor1 = _eyeColor1;
  eyeColor2 = _eyeColor2;
  eyeColor3 = _eyeColor3;
  eyeColor4 = _eyeColor4;
   
   
   
   
}
    
  void run(){
    display();
  }
  
void display(){
    noStroke();
    fill(255);
    pushMatrix();
    translate(width/2, height/2);
      
    // eyeeyeBall
    fill(255);
    ellipse(0, 0, eyesize, eyesize);
      
    // iris
    fill(eyeColor1,eyeColor2,eyeColor3,eyeColor4);
    ellipse(0, 0, middle, middle);  
      
    // pupil
    fill(0);
    ellipse(0, 0, pupil, pupil);  
    popMatrix();
  }
}




