
meteor m1 = new meteor();
money mo1 = new money();

float ufox = -1;
boolean live = true;
float hp = 3;
float money = 0;
boolean pause = false;
int delayshop = 0;
int ufoSpeed = 1;
float pricespeed = 0;
float pricehp = 0;
float hpmax = 3;
//det er dem der vise hvor mange gange du har opgraderet noget
int nr = 1;
int nr2 = 1;

void setup()
{
size(500,500);
}

void draw()
{
background(255,255,255);

if(live == false)
{
noLoop();
}
if(pause != true)
{
text(money,20,20);
ufoMove();
m1.mete();
mo1.penge();
hp();
activateshop();
}else{
shop();
disactivateshop();
speedimmage();
hpimmage();
}

}


void hpimmage()
{
pricehp =100*nr2;
fill(0,0,0);
text("more hp " + pricehp ,30,115); 
noStroke();
fill(255,255,0);
ellipse(150,110,20,20);
fill(0,0,0);
rect(142.5,107.5,15,5);
rect(147.5,102.5,5,15);
}





void speedimmage()
{
pricespeed =100*nr;
fill(0,0,0);
text("more speed " + pricespeed,30,85); 
noStroke();
fill(255,255,0);
ellipse(150,80,20,20);
fill(0,0,0);
rect(142.5,77.5,15,5);
rect(147.5,72.5,5,15);
}


void disactivateshop()
{
//dette er til at den registere ikke den samme tryk på tastaturet.
if(delayshop == 0)
{
delayshop = 100;
}
if(delayshop>1)
{
delayshop = delayshop -1;
}
if(delayshop==1)
{
{
if(keyPressed)
{
if(keyCode == UP)
{
pause = false;
delayshop = 0;
}
}
}
}
}

void activateshop()
{
//dette er til at den registere ikke den samme tryk på tastaturet.
if(delayshop == 0)
{
delayshop = 100;
}
if(delayshop>1)
{
delayshop = delayshop -1;
}
if(delayshop==1)
{
{
if(keyPressed)
{
if(keyCode == UP)
{
pause = true;
delayshop = 0;
}
}
}
}
}

void shop()
{
fill(0,0,0);
text("shop",20,20);
text("your money " + money,20,40);

}

void ufoMove()
{
//dette er til at centrede ofon væd start
if(ufox == -1)
{
ufox = width/2;
}

float ufoy = height-20;
//dette er til at begvege ufo
if(keyPressed)
{
if(keyCode == LEFT)
{
ufox= ufox - ufoSpeed;
}
if(keyCode == RIGHT)
{
ufox= ufox + ufoSpeed;
}
}
//dette er ufo
fill(0,0,0);
ellipse(ufox,ufoy,20,20);

}

float distanza(float x1,float x2,float x3, float x4)
{
float dis = sqrt((x1-x2)*(x1-x2)+(x3-x4)*(x3-x4));
return dis;
}

void hp()
{

float rectp = 100;
fill(255,255,255);
stroke(0,0,0);
rect(width/2-width/6-1,20-1,width/3+1,21);
noStroke();
fill(255,0,0);
rectp = (width/3)*(hp/hpmax);
rect(width/2-width/6,20,rectp,20);
fill(0,0,0);
text(hp,width/2-width/6,35);
if(hp<=0)
{
live = false;
}
}


class money
{
float x = -30;
float y = -30;
float speed = 0;

void penge()
{
//dette er for at give den en ny x 
if(x==-30)
{
x = random(width-20)+10;
speed = random(3,7);
}
y = y + speed;
//dette er for at den starter oppe igen
if(y>=height+20)
{
x = -30;
y = -30;
}
//det er selve meteoren
fill(0,255,0);
noStroke();
ellipse(x,y,20,20);
//hvis den rammer
float d = distanza(ufox,x,height-25,y);
if(d<=20)
{
money = money + 50;
x = -30;
y = -30;
}

}
}






class meteor
{
float x = -30;
float y = -30;
float speed = 0;
void mete()
{
//dette er for at give den en ny x 
if(x==-30)
{
x = random(width-20)+10;
speed = random(3,7);
}
y = y + speed;
//dette er for at den starter oppe igen
if(y>=height+20)
{
x = -30;
y = -30;
}
//det er selve meteoren
fill(255,0,0);
noStroke();
ellipse(x,y,20,20);

float d = distanza(ufox,x,height-25,y);
if(d<=20)
{
hp = hp-1;
x = -30;
y = -30;
}

}
}

void mouseClicked()
{

if(pause=true)
{
//speed upgrade
float s = distanza(mouseX,150,mouseY,80);
if(s<=10)
{
pricespeed =100*nr;
if(money>=pricespeed)
{
ufoSpeed = ufoSpeed + 1;
money = money-(100*nr);
nr = nr*2;
pricespeed =100*nr;
}
}


//hp upgrade
float h = distanza(mouseX,150,mouseY,110);
if(h<=10)
{
pricehp =100*nr2;
if(money>=pricehp)
{
hpmax = hpmax + 1;
hp = hpmax;
money = money-(100*nr2);
nr2 = nr2 * 2;
pricehp =100*nr2;
}


}
}

}





