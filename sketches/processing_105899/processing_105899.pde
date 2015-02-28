
PVector p;
float d;
float dx;
float dz;
float q;

void setup()
{
    p = new PVector(0,0,-3000);
    d=20;
    dx=20; dz=20;
    q=1;
    size(1200,800,P3D);

    background(180,215,246);

    //noStroke();
    lights();
    directionalLight(204, 204, 204, 100, 100, 100);
    camera(0,-4*height,2*height,0,0,0,0,1,0);
    fill(random(165,195),random(196,216),random(150,170));
    pushMatrix();
    translate(height/2.0,width/2.0);
    translate(1250,5000,0);
    box(10000);
    popMatrix();
    fill(200,150,150);

}

void draw()
{
    camera(0,-4*height,2*height,0,0,0,0,1,0);
    if(random(0,1)>0.95 || p.y<-130*d)
    {
        p.y=0;
        
        dx = random(30,500);
        d= 5 + dx*0.05;

        p.x+=random(-10*dx,10*dx);
        p.x=max(-3000,min(3000,p.x));
        p.z+=random(-3.8*dx,4*dx);
        p.z=max(-4000,min(2000,p.z));
        fill(random(160,220),random(130,180),random(130,190));

        q = random(0.2,5);
        if(random(0,1)>0.5) q=1/q;
        dz = q*dx;
    }
    else {
            p.y-=d;     
    }
    if(random(0,1)>0.99)
    {
        dx-=random(0,dx/2.0);
        dz-=random(0,dz/2.0);
    }
    else if(random(0,1)>0.5)
    {
        dx-=random(0,dx/20.0);
        dz-=random(0,dz/20.0);
    }
    else if(random(0,1)>0.66)
    {
        dx+=random(0,dx/20.0);
        dz+=random(0,dz/20.0);
    }
    else if(random(0,1)>0.999)
    {
        dx+=random(0,dx/5.0);
        dz+=random(0,dz/5.0);
    }
    

    pushMatrix();
    translate(height/2.0,width/2.0);
    translate(p.x,p.y,p.z);
    box(dx,d,dz);
    popMatrix();

}
