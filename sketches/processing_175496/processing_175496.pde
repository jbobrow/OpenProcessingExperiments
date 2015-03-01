
class Moon implements Locatable
{
    float x, y; 
    float gap;
    color cor;
    Moon()
    {
        x = 0;
        y = end? random(0, SPACEY) : random(SPACEY/5, SPACEY - SPACEY/5);
        cor = color(random(155)+85, random(155)+85, random(155)+85);
    }
    Moon(float l, float h)
    {
        x = l;
        y = h;
        cor = color(random(255), random(255), random(255));
    }
    PVector getLocation()
    {
        return new PVector(x,y);
    }
    void flight()
    {
        Set<Moon> near = moons.get( new PVector(x, y) );
        float toSun = dist(x, y, sun.x, sun.y);
        gap = 10 + sun.light;
        //due to moon
        for(Moon moon : near)
        {
            if(moon != this && (!wrap.contains(moon)))
            {
                float toMoon = dist(x,y,moon.x,moon.y);
                float spd = toSun < gap ? 0.002 : 0.08;
                x += spd*(moon.x - x)/toMoon;
                y += spd*(moon.y - y)/toMoon;
                score++;
            }    
        }
        //due to Sun
        if(toSun < gap)
        {
            float push = 1 + (VMAX-1)*exp(-toSun);
            x += push*(x - sun.x)/toSun;
            y += push*(y - sun.y)/toSun;      
        }
        if(toSun < gap && x < sun.x)
        {
            float spd = y - sun.y > 0 ? -0.4 : 0.4;
            x += -spd*(y - sun.y)/toSun;
            y += spd*(x - sun.x)/toSun;
        }
        //side movement
        else
        {
            float spd = end? 1.15 : 0.8;
            x += -spd*(y - OFFY)/dist(x,y,OFFX,OFFY);
            y += spd*(x - OFFX)/dist(x,y,OFFX,OFFY);
        }
    } 
    void bound()
    {
        //boundary cases
        if(x > SPACEX + DMOON)
        {
            wrap.add(this);      
        } 
        if(y>SPACEY+DMOON/2 || y<-DMOON/2)
        {
            trash.add(this);
        }
    }
    void draw()
    {
        noStroke();
        fill(cor);
        ellipse(x, y, DMOON, DMOON);    
    }
}

