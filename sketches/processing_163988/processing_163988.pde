
int prevsec;
int starttime;
int curtime;
int dir; // 1 or -1
float cPos =1;

void setup() {
  size(400, 400);
  prevsec = second(); 
  starttime = millis();
  dir = 1;
}
 
void draw() {
  background(0);
  curtime = millis() - starttime;
 
 if(dir == 1)
   {
   cPos = map(curtime, 0, 1000, width/2-100, width/2+100);
   }
   
 if(dir == -1)
   {
   cPos = map(curtime, 0, 1000, width/2+100, width/2-100);
   }
   
 
  if (prevsec != second()) {
    prevsec = second();
    starttime = millis();
    println("Tick " + prevsec);
    dir = -dir;
     println(curtime);
  }
  

  //float cirsize = map(curtime, 0, 1000, 0, 200);
  //ellipse(width/2, height/2, cirsize, cirsize);
  
  ellipse(cPos, height/2, 200, 200);
}
