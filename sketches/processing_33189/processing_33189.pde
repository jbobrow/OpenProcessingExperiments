


int x = 0;
int y = 0;

int a= 5;
int b= 5;

int c= 0;
int d= 0;

int e= 0;
int f= 0;

int g=20;
int h= 10;

int i=0;
int j= 5;


int k=100;
int l= 0;

int aa=0;
int bb= 0;

int cc= 0;
int dd= 0;

int ee= 0;
int ff= 0;

int gg= 0;
int hh= 0;

int ii= 0;
int jj= 0;

int kk= 0;
int ll= 0;

int mm= 0;
int nn= 0;

int oo= 0;
int pp= 0;

int qq= 0;
int rr= 0;

int ss= 0;
int tt= 0;

int uu = 00;
int vv= 0;

int ww= 0;
int xx= 0;

int yy= 0;
int zz= 0;

void setup(){
	size(800,600);
	background(0);
	fill(150,0,0);
        noStroke();
        smooth();

}




void draw(){
        background(0);
        fill(155);
	ellipse(x,y,50,50);
	x++;
	y +=2;


        fill(0,150,255);
        ellipse(a,b,20,20);
        a+=2;
        b+=5;
        
        fill(120,15,0);
        ellipse(c,d,20,20);
        c+=2;
        d+=2;
        
        fill(139,5,69);
        ellipse(c,d,60,60);
        e+=4;
        f+=4;

        fill(100,150, 0);
        ellipse(g,h,15,15);
        g+=8;
        h+=8;
        
        fill(200);
        ellipse(i,j,15,15);
        i++;
        j+=2;
        
        fill(50,10, 0);
        ellipse(k,l,65,65);
        k++;
        l+=3;
        
         fill(50,150, 0);
        ellipse(aa,bb,20,20);
        aa++;
        bb+=3;
      
       fill(60,40, 10);
        ellipse(cc,dd,65,65);
        cc+=7;
        dd+=3;
        
        
       fill(50,150, 0);
        ellipse(ee,ff,65,65);
        ee +=9;
        ff+=3;
        
        
       fill(50,10,200);
        ellipse(gg,hh,65,65);
        gg+=2;
        hh+=3;
        
        
       fill(50,0, 0);
        ellipse(ii,dd,65,65);
        ii++;
        jj+=3;
        
        
       fill(50,150, 0);
        ellipse(kk,ll,65,65);
        kk++;
        ll+=9;
        
        
       fill(50,150, 0);
        ellipse(mm,nn,65,65);
        mm++;
        nn+=4;
        
        
       fill(50,150, 0);
        ellipse(oo,pp,65,65);
        oo+=3;
        pp++;
        
        
       fill( 255);
        ellipse(qq,rr,65,65);
        qq+=2;
        rr+=1.5;
        
        
       fill(127);
        ellipse(ss,tt,65,65);
        ss+=11;
        tt++;
        
        
       fill(50,0, 2);
        ellipse(uu,vv,65,65);
        uu+=1.2;
        vv+=2.5;
        
        
       fill(50,0, 10);
        ellipse(ww,xx,65,65);
        ww+=1.9;
        xx+=2;
        
        
       fill(20,0, 0);
        ellipse(yy,zz,65,65);
        yy+=3.5;
        zz+=4.3;
        
  
        println("x value is" + x);
        println("y value is" + y);
}

