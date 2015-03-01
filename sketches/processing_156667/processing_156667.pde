

int i = 0;
int j = 0;
Boolean move=false;
void setup() {
    size(500, 500); 
 
} 

void draw() {
    background(23,123,159);
       

    if(move==false){
  
     for(int j = 0; j < 100; j++){
        
    for(int i = 0; i < 100; i++){ stroke(146,250,127);
       line(i*5,j*5,width-i*5,width-j*5);
    }}
    }
           
   else{
     for(int j = 0; j < 100; j++){
        
    for(int i = 0; i < 100; i++){stroke(random(200),69,82);
       line(i*5,j*5,height-i*5,height-j*5);
    }
    
    }
    
    }}
     
  


void mouseMoved(){
if(mouseX>200&&mouseX<300&&mouseY<300&&mouseY>200){
move=true;
}

}




