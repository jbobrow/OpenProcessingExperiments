
float [] x;

void setup () {
  size(400, 400);
  background(10, 20, 50);
  
  
  
}


void draw () {
  
  x = new float [4];

  for (int i = 0; i < 3; i++) {
    x [i] = i*100;
  noStroke();
  frameRate(30);
  background(10, 20, 50);
  noCursor();
 
  if (mousePressed) {
   x [2]=mouseX/4+mouseY/4;
  }
    fill(frameCount*2%256, frameCount*1.4%256, frameCount*3%256);
  

  //quad mosaico

  quad(5, 4, 58, 12, 52, 47, 8, 42);
  quad(63, 3, 127, 7, 113, 64, 54, 48);
  quad(132, 3, 163, 12, 167, 48, 115, 67);
  quad(165, 5, 199, 2, 196, 47, 168, 50);
  quad(4, 45, 78, 58, 84, 132, 7, 121);
  quad(83, 65, 133, 72, 127, 127, 88, 133);
  quad(137, 64, 189, 49, 197, 113, 132, 133);
  quad(2,122,67,134,63,197,4,199);
quad(74,133,114,134,120,196,68,195);
  quad(117,137,149,133,156,195,124,198);
  quad(152,131,196,118,198,197,161,191);
  
  
  
  quad(5+x [2], 4, 58+x [2], 12, 52+x [2], 47, 8+x [2], 42);
  quad(63+x [2], 3, 127+x [2], 7, 113+x [2], 64, 54+x [2], 48);
  quad(132+x [2], 3, 163+x [2], 12, 167+x [2], 48, 115+x [2], 67);
  quad(165+x [2], 5, 199+x [2], 2, 196+x [2], 47, 168+x [2], 50);
  quad(4+x [2], 45, 78+x [2], 58, 84+x [2], 132, 7+x [2], 121);
  quad(83+x [2], 65, 133+x [2], 72, 127+x [2], 127, 88+x [2], 133);
  quad(137+x [2], 64, 189+x [2], 49, 197+x [2], 113, 132+x [2], 133);
  quad(2+x [2],122,67+x [2],134,63+x [2],197,4+x [2],199);
quad(74+x [2],133,114+x [2],134,120+x [2],196,68+x [2],195);
  quad(117+x [2],137,149+x [2],133,156+x [2],195,124+x [2],198);
  quad(152+x [2],131,196+x [2],118,198+x [2],197,161+x [2],191);
  
  
  quad(5+x [2], 4+x [2], 58+x [2], 12+x [2], 52+x [2], 47+x [2], 8+x [2], 42+x [2]);
  quad(63+x [2], 3+x [2], 127+x [2], 7+x [2], 113+x [2], 64+x [2], 54+x [2], 48+x [2]);
  quad(132+x [2], 3+x [2], 163+x [2], 12+x [2], 167+x [2], 48+x [2], 115+x [2], 67+x [2]);
  quad(165+x [2], 5+x [2], 199+x [2], 2+x [2], 196+x [2], 47+x [2], 168+x [2], 50+x [2]);
  quad(4+x [2], 45+x [2], 78+x [2], 58+x [2], 84+x [2], 132+x [2], 7+x [2], 121+x [2]);
  quad(83+x [2], 65+x [2], 133+x [2], 72+x [2], 127+x [2], 127+x [2], 88+x [2], 133+x [2]);
  quad(137+x [2], 64+x [2], 189+x [2], 49+x [2], 197+x [2], 113+x [2], 132+x [2], 133+x [2]);
  quad(2+x [2],122+x [2],67+x [2],134+x [2],63+x [2],197+x [2],4+x [2],199+x [2]);
quad(74+x [2],133+x [2],114+x [2],134+x [2],120+x [2],196+x [2],68+x [2],195+x [2]);
  quad(117+x [2],137+x [2],149+x [2],133+x [2],156+x [2],195+x [2],124+x [2],198+x [2]);
  quad(152+x [2],131+x [2],196+x [2],118+x [2],198+x [2],197+x [2],161+x [2],191+x [2]);
  
  
  
  quad(5, 4+x [2], 58, 12+x [2], 52, 47+x [2], 8, 42+x [2]);
  quad(63, 3+x [2], 127, 7+x [2], 113, 64+x [2], 54, 48+x [2]);
  quad(132, 3+x [2], 163, 12+x [2], 167, 48+x [2], 115, 67+x [2]);
  quad(165, 5+x [2], 199, 2+x [2], 196, 47+x [2], 168, 50+x [2]);
  quad(4, 45+x [2], 78, 58+x [2], 84, 132+x [2], 7, 121+x [2]);
  quad(83, 65+x [2], 133, 72+x [2], 127, 127+x [2], 88, 133+x [2]);
  quad(137, 64+x [2], 189, 49+x [2], 197, 113+x [2], 132, 133+x [2]);
  quad(2,122+x [2],67,134+x [2],63,197+x [2],4,199+x [2]);
quad(74,133+x [2],114,134+x [2],120,196+x [2],68,195+x [2]);
  quad(117,137+x [2],149,133+x [2],156,195+x [2],124,198+x [2]);
  quad(152,131+x [2],196,118+x [2],198,197+x [2],161,191+x [2]);
  
  
  
  
  
  
}}


