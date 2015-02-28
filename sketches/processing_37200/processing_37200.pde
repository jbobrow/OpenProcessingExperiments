
float x=0;
float y=0;

void setup(){
  size(500, 500);
  background(255);
  smooth();
}
  
void draw(){
//draw lines
smooth();

for(int i=0; i<width/2; i+=30){
       
            line (i, 0, 0, width);
      }
          for(int b=0; b<width/2; b+=30){
            line(0, b, width, 0);
          }

}
                
                
