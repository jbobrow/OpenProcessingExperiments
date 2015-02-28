
int x=1, y=400;
int v_x=1, v_y=0;
int a_x=0, a_y=1;
//v loss on collision
int ine=1;

void setup()
{
    size(500,500);
}

void draw()
{
    background(255,255,255);
    ellipse(x, y, 10, 10);
    x += v_x;
    y += v_y;
    v_x += a_x;
    v_y += a_y;
    if(x >= 500)
        v_x = ine - v_x;
    if(x <= 0)
        v_x = 0 + ine - v_x;
    if(y >= 500)
        v_y = ine - v_y;
    if(y <= 0)
        v_y = 0 + ine - v_y;
}
