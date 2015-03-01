
void setup() {
    size(500, 500); 

} 

void draw() {
  noStroke();
    background(255,255,255);

    for(int j = 0; j < mouseY/50; j++){
        
    for(int i = 0; i < mouseX/50; i++){
      fill(106,168,82,80);
       rect(0,j*50,500,20);
       rect(i*50,0,20,500);
          
       fill(153,86,98,80);
          rect(0,500-j*50,500,20);
       rect(500-i*50,0,20,500);
       fill(184,69,67);
       rect(0,j*50,500,5);
       rect(i*50,0,5,500);
  
         fill(224,225,135);
        rect(0,500-j*50,500,5);
       rect(500-i*50,0,5,500);
    }
    
    }
}



