
int Width=200;
int Height=200;

 
void setup(){
size(200,200);
  background(255);
  
}

 
void draw() {  //draw function loops 
      int i,j,a=0;
      stroke(5);
      for(i=5 ; i < Height ; i = i +10){
        for(j=5;j<Width;j=j+10){
                if(a%2==0){
                    fill(255);
                }
                else{
                    fill(0);
                }
                ellipse(i,j,5,5);
                a++;
        }
        a++;
      }
}
 

                
                                
