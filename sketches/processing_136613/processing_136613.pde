
float eyesize[] = {55,90};
float pupil[] = {5,25};
float middle[] = {50,75,100};
float eyeColor1[] = {150,183,170};
float eyeColor2[] = {0,27,255};
float eyeColor3[] = {75,255,0};
float eyeColor4[] = {0,149,239};
int eyeX = 50;
int eyeY = 50;
int rowNum = 0;
int counter = 0; 
 
 
eyeball[] EyeBall1 = new eyeball[25];                      
 
void setup(){
   background(0);
  size(500,500);
  for (int i = 0; i < EyeBall1.length; i ++ ) {
  EyeBall1[i] = new eyeball(
    random(eyesize[0],eyesize[1]),
    random(pupil[0],pupil[1]),
    random(middle[0],middle[2]),
    random(eyeColor1[0],eyeColor1[2]),
    random(eyeColor2[0],eyeColor2[2]),
    random(eyeColor3[0],eyeColor3[2]),
    random(eyeColor4[0],eyeColor4[2])
    );   
}
 
  background(0);
  for (int i = 0; i < EyeBall1.length; i ++ ){
    pushMatrix();
    translate(50,0);
    eyeX = 100 * counter;
    counter++;
    EyeBall1[i].run();
    popMatrix();
    if (counter == 5){
      eyeY = eyeY + 100;
      counter = 0;
   
     }
  }
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
     
    // eyeeyeBall
    fill(255);
    ellipse(eyeX, eyeY, eyesize, eyesize);
     
    // iris
    fill(eyeColor1,eyeColor2,eyeColor3,eyeColor4); 
    ellipse(eyeX, eyeY, middle, middle);   
     
    // pupil
    fill(0); 
    ellipse(eyeX, eyeY, pupil, pupil);   
  }
}


