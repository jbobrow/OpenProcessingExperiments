

void setup(){
size(600,600);
background(200);
for(int i=0; i<10; i++){
    for(int j=0; j<10; j++){ 
      pushMatrix();
      translate(i*60, j*60);
      //body
       noStroke();
       fill(0);
       arc(30,40,38,60,PI,2*PI);
       arc(42, 65, 70, 123, PI, PI*4/3);
       arc(20,65,70,123,PI*5/3,PI*2);
       man((int)random(0,6));
       popMatrix();
    }
}
  
}

void man(int k){
//face
fill(255);
ellipse(30,32,27,37);

//face dot
fill(200);
ellipse(23,23,3,6);
ellipse(36,23,3,6);
ellipse(23,34,8,2);
ellipse(36,34,8,2);
ellipse(23,40,3,6);
ellipse(36,40,3,6);

switch(k){
/////////////////////////////////////////////hands
        case 0:  
          //eyes
          fill(0);
          ellipse(23,30,8,3);
          ellipse(36,30,8,3);      
          fill(255);
          //left arm
          beginShape();
          vertex(15, 53);
          vertex(20, 53);
          vertex(26, 65);
          vertex(23, 65);
          endShape();
          //right arm
          beginShape();
          vertex(40, 53);
          vertex(45, 53);
          vertex(38, 65);
          vertex(35, 65);
          endShape();
          break;
/////////////////////////////////////////////smile
        case 1:   
          //eyes
          fill(0);
          ellipse(23,30,8,3);
          ellipse(36,30,8,3);     
          //mouth
          arc(30,45,8,3,0,PI);
          fill(254,114,114);
          //cheek
          ellipse(21,36,7,5);
          ellipse(38,36,7,5);
          break;
       
/////////////////////////////////////////////scare
        case 2:
          //eyes
          fill(0);
          ellipse(23,30,6,6);
          ellipse(36,30,6,6);
          //face cover
          fill(255);
          arc(30,48,16,16,0,PI);
          fill(0);
          ellipse(30,48,4,10);
          arc(17,48,12,33,PI*4/3,PI*9/4);
          arc(44,48,12,33,PI/2,PI*3/2);
          //hands
          fill(255);
          arc(16,49,10,30,PI*4/3,PI*8/4);
          arc(45,49,10,30,PI,PI*5/3);
          break;
/////////////////////////////////////////////sleep
        case 3:
           fill(100);
           arc(23,30,8,3,0,PI);
           arc(36,30,8,3,0,PI);
           beginShape();
           vertex(27, 10);
           vertex(28, 10);
           vertex(31, 38);
           vertex(30, 38);
           endShape(); 
           beginShape();
           vertex(27, 38);
           vertex(31, 38);
           vertex(31, 39);
           vertex(27, 39);
           endShape(); 
           beginShape();
           vertex(27, 39);
           vertex(28, 39);
           vertex(30, 50);
           vertex(29, 50);
           endShape();
           fill(0,100);
           arc(30,37,28,53,PI*7/5,PI*2); 
           arc(28,37,29,53,PI*2,PI*5/2);          
           break;
/////////////////////////////////////////////ar?!
        case 4:
           fill(0);
          ellipse(23,30,6,6);
           ellipse(36,30,6,6);
           fill(80);
           rect(10,6,2,20);
           rect(15,6,2,13);
           rect(20,6,2,6);
           fill(254,114,114);
           ellipse(21,36,7,5);
           ellipse(38,36,7,5);          
           break;
/////////////////////////////////////////////yeah
        case 5:
           fill(0);
           ellipse(23,30,8,3);
           ellipse(36,30,8,3);     
           arc(30,43,8,8,0,PI);
           //hand
           ellipse(5,33,8,8);
           rect(3,24,2,7);
           rect(6,24,2,7);
           //arm
           beginShape();
           vertex(3, 33);
           vertex(6, 33);
           vertex(22, 60);
           vertex(15, 60);
           endShape();                  
           break;
      
      }       
}



