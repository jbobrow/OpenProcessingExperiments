

int r,g,b; //ironosuuti
int x,y,z; //ookisanosuuti

void setup() { //kihonsettei
  size(600, 600);
  background(255);
  noStroke();
  smooth();
  
  r = 0;
  g = 0;
  b = 0;
  
  x = 0;
  y = 0;
  z = 5;
}

void draw(){ //ironosettei
 fill(r,g,b);
}

void mousePressed(){ //kurikkudesikaku
  rect(mouseX,mouseY+30+x,z,z);
  rect(mouseX,mouseY-30-x,z,z);
  rect(mouseX+30+x,mouseY,z,z);
  rect(mouseX-30-x,mouseY,z,z);
  rect(mouseX,mouseY,y,y);  
}

void mouseDragged(){ //dorakkudemosikaku
  rect(mouseX,mouseY+30+x,z,z);
  rect(mouseX,mouseY-30-x,z,z);
  rect(mouseX+30+x,mouseY,z,z);
  rect(mouseX-30-x,mouseY,z,z);
  rect(mouseX,mouseY,y,y);  
}

void keyPressed(){ //zyuuziki-
  if(key == CODED){
    if(keyCode == UP){ //uedezyozyonisiroku
      r = g = b += 5;
    if(r == g == b >= 255) b = 255;
  }else if(keyCode == DOWN){ //sitadezyozyonikuroku
    r = g = b -= 5;
    if(r == g == b <= 0) b = 0;
  }else if (keyCode == LEFT) {  //hidaridemassironi   
    background(255);
  }else if (keyCode == RIGHT) { //migidemakkuroni   
    background(0); 
    }
 }
  
  switch(key) { //ki-nyuuryoku (shift)
    case 'R': //Rdeakazyousyou
      r += 5;
  if(r >=255) r = 255;    
      break;
    case 'G': //Gdemidorizyousyou
      g += 5;
  if(g >=255) g = 255;   
      break;
    case 'B': //Bdeaozyousyou
      b += 5;
  if(b >=255) b = 255;    
      break;
    case 'E': //Edeakagensyou
      r -= 5;
  if(r <=0) r = 0;    
      break;
    case 'F': //Fdemidorigensyou
      g -= 5;
  if(g <=0) g = 0;   
      break;
    case 'V': //Vdeaogensyou
      b -= 5;
  if(b <=0) b = 0;    
      break;
    case 'A': //sikakuwoookiku
      z += 5;
  if(z >=100) z = 100;    
      break;
    case 'S': //sikakuwotiisaku
      z -= 5;
  if(z <=5) z = 5;    
      break;
    case 'W': //shikakunokankakuhiroku
      x += 5;
  if(x >=70) x = 70;    
      break;
    case 'Z': //shikakunokankakusemaku
      x -= 5;
  if(x <=-25) x = -25;    
      break;
     case 'D': //shikakuhitotuni
      y = 5;
      z = 0;    
      break;
     case 'C': //shikakuyottuni
      y = 0;
      z = 5;    
      break;
     case 'X': //tyuushinnoshikakusaizuhenkou
      y += 5;
  if(y > 100) y = 5;
      break;
     
  }
}


