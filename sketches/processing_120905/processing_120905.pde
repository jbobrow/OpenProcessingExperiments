
ball ball1, ball2, ball3, ball4, ball5;
boolean keydown = false;

void setup()
{
    size(400, 400);
    ball1 = new ball();
    ball2 = new ball();
    ball3 = new ball();
    ball4 = new ball();
    ball5 = new ball();
    ellipseMode(CENTER);
}

void draw()
{
    background(200);
    fill(255);
    text("Hold musen over en cirkel og tryk på en tast", 10, 10);
    ball1.step();
    ball2.step();
    ball3.step();
    ball4.step();
    ball5.step();
}

class ball
{
    boolean active = false;
    float x, y;
    int size;

    ball()
    {
        x = random(0, width);
        y = 20 + random(0, 50);
        size = round(random(20, 60));
    }
    void step()
    {
        if (keyPressed && !keydown)
        {
            if (point_distance(x, y, mouseX, mouseY) < size / 2)
            {
                keydown = true;
                if (active)
                {
                    active = false;
                }
                else
                {
                    active = true;
                }
            }
        }
        if (active)
        {
            y++;
            fill(0, 255, 0);
        }
        else
        {
            fill(255, 0, 0);
        }
        if (y > height)
        {
            y = 0;
        }

        ellipse(x, y, size, size);
    }
}

void keyReleased()
{
    keydown = false;
}

float point_distance(float x1, float y1, float x2, float y2)
{
    float dis = abs(sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)));
    return dis;
}
