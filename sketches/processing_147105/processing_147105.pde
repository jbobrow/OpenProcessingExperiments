
void setup() {
  size(480, 360);
  background(87);
  stroke(255);
  smooth();
  noLoop();
}
void draw(){
    
    projection(7, 9, 3, "Movie 1");
    projection(4.5, 7, 2, "Movie 2");
    projection(2, 1, 6, "Movie 3");
}

void projection(float RT, float L, float G, String MovieName){
  
  float inicio = 100;
  line(inicio, 0, inicio, 360);
  textAlign(RIGHT);
  //text(MovieName+" ", inicio, 360-RT*36+4); 
  line(460, 0, 460, 360);
  float a=G;
  stroke(255,255,255,10);
  strokeWeight(2);
  float jump = 0.01;
  if (a<=L){
    text(MovieName+" ", inicio, 360-RT*36+4); 
    while (a<=L) {
      smooth(8);
      line(inicio, 360-RT*36, 460, 360-a*36);
      a=a+jump;
      
    }
  }
   else if (a>L){
     fill(0,0,0);
     text(MovieName+" ", inicio, 360-RT*36+4); 
     fill(255,255,255);
     while (a>L) {
      smooth(8);
      line(inicio, 360-RT*36, 460, 360-a*36);
      a=a-jump;
      }
   }
 
 
}
