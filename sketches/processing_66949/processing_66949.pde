
int[] lON;
int[] sizeRec;

void setup() {
  size(500, 500);

  lON = new int[5];
  for (int i = 0; i < lON.length; i++) { // .length indicates the length of the array.
    lON[i] = i*100;
  }
  
  sizeRec = new int[5];
  for(int i = 0; i < sizeRec.length; i++){
    sizeRec[i] = 10;
  }
  
}

void draw() {
 background(135, 169, 107);
  
  for (int i = 0; i < lON.length; i++) {
     if(mouseX > 125 && mouseX < (125 + sizeRec[i]) 
     && mouseY > lON[i] && mouseY < (lON[i] + sizeRec[i]) && mousePressed == true){
       fill(255, 165, 0);
       sizeRec[i]++;

     }
     
     else{
      fill(30, 77, 43); 
     }
    rect(125, lON[i], sizeRec[i], sizeRec[i]);
  }
  
  
}
