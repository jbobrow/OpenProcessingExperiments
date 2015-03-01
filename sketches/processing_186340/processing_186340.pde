
float fuck = 1 ;
float refuck = -1 ;
void setup(){
size(500,500);
}
void draw () {
  
stroke(50,0,100);
fuck = fuck* 1.1;
line(fuck,600,0,0);

stroke(100,0,0);
refuck = refuck +10.5;
line(refuck,0,0,600);
}

