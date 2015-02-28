
void setup() {
  size(500, 500);
  background(0);
  i=1;  
  j = 30;  
  k = 120;  
  counti = 1;  
  countj = 1;  
  countk = 1;
}
int i;
int j;
int k;
int counti;
int countj;
int countk;
int a;
int b;
int c;
int d;

void reali ()
{
  if ( i == 0)
  {
    counti ++;
  } 
  else if (i==255)
  {
    counti++;
  }
}
void realj () { 
  if ( j == 0) {   
    countj ++;
  }  
  else if (j==255) {   
    countj++;
  }
}

void realk () {  
  if ( k == 0) {    
    countk ++;
  }   
  else if (k==255) {    
    countk++;
  }
}



void draw() {  
  stroke(255);  
  if (counti%2 == 0) {
    i--;    
    reali();
  }
  else if (countj%2 == 0) {    
    j--;    
    realj();
  }  
  else if (countk%2 == 0) {    
    k--;    
    realk();
  }  
  else {   
    i++;    
    j++;    
    k++;    
    reali();    
    realj();    
    realk();
  }
  fill(i, j, k);
  if (mousePressed) {    
    triangle(mouseX, mouseY-30, mouseX-30, mouseY+30, mouseX+30, mouseY+30);
  }
  else {    
     ellipse(mouseX, mouseY, 75, 75);
   
  }
}



