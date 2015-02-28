
//Sarah Anderson, seanders
//EMS HW6 Clock


color colS, colM, colH;
float s,m,h,rotS,rotM, rotH,txt;



void setup()
{
size(400,400);
smooth();
background(50);
colS= color(random(255),random(255),random(255));
colM= color(random(255),random(255),random(255));
colH= color(random(255),random(255),random(255));
s= second();
m= minute();
h= hour();


}

void draw()
{

secs();
mins();
hours();

  if (second()%60==0)//resets the seconds
    {
    
    background(50);
    secs();
    mins();
    hours();
    }
  
}



void secs()
{
rotS=map(second(),0,59,-180,180);  
strokeWeight(10);  
stroke(colS);
pushMatrix();
translate(width/2,height/2);
rotate(radians(rotS));
line(0,0,0,height/2.5);
popMatrix();

  
}

void mins()
{
rotM=map(minute(),0,59,-180,180);  
strokeWeight(15);  
stroke(colM);
pushMatrix();
translate(width/2,height/2);
rotate(radians(rotM));
line(0,0,0,height/3.5);
popMatrix();  
}

void hours()
{
rotH=map(hour()%12,0,23,-180,180);  
strokeWeight(20);  
stroke(colH);
pushMatrix();
translate(width/2,height/2);
rotate(radians(rotH));
line(0,0,0,height/5);
popMatrix();    
}
  

