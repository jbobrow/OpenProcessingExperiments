
float[][] colorsOriginals = {/*GREEN*/{20,220,20,10,170,10},/*RED*/{220,20,20,170,10,10},/*YELLOW*/{220,220,20,170,170,10},/*BLUE*/{20,20,220,10,10,170}};
float[][] colorsMax       = {/*GREEN*/{40,255,40,20,220,20},/*RED*/{255,40,40,220,20,20},/*YELLOW*/{255,255,40,220,220,20},/*BLUE*/{40,40,255,20,20,220}};
float[][] colorsDina      = {/*GREEN*/{20,220,20,10,170,10},/*RED*/{220,20,20,170,10,10},/*YELLOW*/{220,220,20,170,170,10},/*BLUE*/{20,20,220,10,10,170}};
float[][] pos = {{13,13,178,178},{209,13,178,178},{13,209,178,178},{209,209,178,178}};
Temps cronometre;
void setup(){
  size(400,400);
}

void draw(){
  background(255);
      for(int j = 0; j<colorsOriginals[0].length;j++){      
        if(keyPressed){
          if(key=='q'){
            colorsDina[0][j] = colorsMax[0][j];
          }
        }else if(colorsDina[0][j]>colorsOriginals[0][j]){
            colorsDina[0][j] = colorsOriginals[0][j];
        }
        if(keyPressed){
          if(key=='w'){
            colorsDina[1][j] = colorsMax[1][j];
          }
        }else if(colorsDina[1][j]>colorsOriginals[1][j]){
            colorsDina[1][j] = colorsOriginals[1][j];
          }
        if(keyPressed){
          if(key=='e'){
            colorsDina[2][j] = colorsMax[2][j];
          }
        }else if(colorsDina[2][j]>colorsOriginals[2][j]){
            colorsDina[2][j] = colorsOriginals[2][j];
          }
        if(keyPressed){
           if(key=='r'){
            colorsDina[3][j] = colorsMax[3][j];
          }
        }else if(colorsDina[3][j]>colorsOriginals[3][j]){
            colorsDina[3][j] = colorsOriginals[3][j];
          }
      }
  
  
  //GREEN
  
  strokeWeight(8);
  fill(colorsDina[0][0],colorsDina[0][1],colorsDina[0][2]);
  stroke(colorsDina[0][0],colorsDina[0][1],colorsDina[0][2]);
  rect(pos[0][0],pos[0][1],pos[0][2],pos[0][3]);
  stroke(colorsDina[0][3],colorsDina[0][4],colorsDina[0][5]);
  noFill();
  rect(pos[0][0],pos[0][1],pos[0][2],pos[0][3]);
  
  // RED
  strokeWeight(8);
  fill(colorsDina[1][0],colorsDina[1][1],colorsDina[1][2]);
  stroke(colorsDina[1][0],colorsDina[1][1],colorsDina[1][2]);
  rect(pos[1][0],pos[1][1],pos[1][2],pos[1][3]);
  stroke(colorsDina[1][3],colorsDina[1][4],colorsDina[1][5]);
  noFill();
  rect(pos[1][0],pos[1][1],pos[1][2],pos[1][3]);
 // YELLOW
  strokeWeight(8);
  fill(colorsDina[2][0],colorsDina[2][1],colorsDina[2][2]);
  stroke(colorsDina[2][0],colorsDina[2][1],colorsDina[2][2]);
  rect(pos[2][0],pos[2][1],pos[2][2],pos[2][3]);
  stroke(colorsDina[2][3],colorsDina[2][4],colorsDina[2][5]);
  noFill();
  rect(pos[2][0],pos[2][1],pos[2][2],pos[2][3]);
 // BLUE
  strokeWeight(8);
  fill(colorsDina[3][0],colorsDina[3][1],colorsDina[3][2]);
  stroke(colorsDina[3][0],colorsDina[3][1],colorsDina[3][2]);
  rect(pos[3][0],pos[3][1],pos[3][2],pos[3][3]);
  stroke(colorsDina[3][3],colorsDina[3][4],colorsDina[3][5]);
  noFill();
  rect(pos[3][0],pos[3][1],pos[3][2],pos[3][3]);
  
  strokeWeight(10);
  stroke(10);
  rect(4,4,width-9,height-9);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  
  strokeWeight(13);
  stroke(10);
  fill(245);
  ellipse(width/2,height/2,130,130);
  fill(10);
  textAlign(CENTER);
  textSize(40);
  text('Q',width/4-5,height/4+10);
  text('W',width/4*3,height/4+10);
  text('E',width/4-5,height/4*3+10);
  text('R',width/4*3-5,height/4*3+10);
}
