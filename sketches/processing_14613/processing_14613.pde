
int Width=200;
int Height=200;
 

void setup(){
size(200,200);
  background(255);

}
 
  
void draw() {  //draw function loops
      int i,j,a=0;
      stroke(5);
      for(i=10 ; i < Height ; i = i +20){
        for(j=10;j<Width;j=j+20){
                if(a%2==0){
                    fill(255);
                }
                else{
                    fill(0);
                }
                ellipse(i,j,10,10);
                a++;
        }
        a++;
      }
}
  
 
                                                
