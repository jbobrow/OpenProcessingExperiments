
void setup()
{
  size(950,600);
}

int count = 1;
int a = 31; 
int i = 1;
int j = 30;
int k = 120;
int e = 2;
int b = 31;
int c = 121;
int counti = 1;
int countj = 1;
int countk = 1;


void resetColor ()
{
if(e == i)
{
    if (b ==j)
    {
        if (c == k)
        {
        
    i = int(random(255));
    j = int(random(255));
    k = int(random(255));
    e = i ++;    
    b = j++;
    c = k ++;
}
}
} 
}

void changesize ()
{
  if (a == 30)
  {
    count++;
  } 
  else if (a == 200)
  {
    count++;
  }
}
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
 
void fillChange()
{

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

}


void draw ()
{
changesize();
//resetColor();
    fill(i, j, k);

stroke(k,i,j);
if(mousePressed)
{
  if(count%2 ==0)
  {
     
    ellipse(mouseX, mouseY, a, a);

    fillChange();
    
  }
  else if (count%2==1)
  {
   
    ellipse(mouseX, mouseY, a, a);

    fillChange();
    
  }
  }
  else
  {
   if(count%2 ==0)
  {
     
    ellipse(mouseX, mouseY, a, a);

    fillChange();
    a++;
  }
  else if (count%2==1)
  {
   
    ellipse(mouseX, mouseY, a,a);

    fillChange();
    a--;
  }
  }
}
