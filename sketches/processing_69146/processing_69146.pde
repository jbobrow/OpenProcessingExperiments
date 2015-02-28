
int SIZE_X = 300;
int SIZE_Y = 100;
boolean[][] obstacles = new boolean[SIZE_X][SIZE_Y];
float[][] levels = new float[SIZE_X][SIZE_Y];
float[][] buffer = new float[SIZE_X][SIZE_Y];
float[][] flow = new float[SIZE_X][SIZE_Y];
boolean[][] changed = new boolean[SIZE_X][SIZE_Y];
boolean isValid(int x, int y)
{
    return x >= 0 && y >= 0 && x < SIZE_X && y < SIZE_Y;   
}


public void resetBuffer()
{
    for(int x = 0; x < SIZE_X; x++)
    {
        for(int y = 0; y < SIZE_Y; y++)
        {
            buffer[x][y] = levels[x][y];
            changed[x][y] = false;
        }
    }    
}

int s = 4;

public void setup()
{
    size(SIZE_X * s, SIZE_Y * s);
    
    for(int x = 0; x < SIZE_X; x++)
    {
        float h = noise(x * 0.01, 0, 0) * SIZE_Y;
        for(int y = 0; y < SIZE_Y; y++)
        {
            changed[x][y] = false;
            flow[x][y] = random(-10, 10);
            if(y > h && noise(x * 0.05, y * 0.05, 0) < 0.6f)
            {
                obstacles[x][y] = true;
            }
            else
            {
                levels[x][y] = (char)random(0, 100);   
            }
        }
    }
    background(0);

}

void mouseDragged()
{
    int ox = mouseX / s;
    int oy = mouseY / s;
    
    if(isValid(ox, oy))
    {
        if(mouseButton == RIGHT)
        {
            for(int nx = -1; nx <= 1; nx++)
            {
                for(int ny = -1; ny <=1; ny++)
                {
                    int x = ox + nx;
                    int y = oy + ny;
                    
                    if(isValid(x, y))
                    {
                        obstacles[x][y] = false;  
                        changed[x][y] = true;
                        levels[x][y] = 0;
                        fill(0, 0, 0);
                        noStroke();
                        rect(x * s, y * s, s, s);
                    }
                }
            }
        }
        else
        {
            levels[ox][oy] = (int)random(100, 200);   
            changed[ox][oy] = true;
        }
    }
}

boolean firstIter = true;

public void draw()
{

    resetBuffer();
    for(int y = 0; y < SIZE_Y; y++)
    {
        for(int x = 0; x < SIZE_X; x++)
        {
            if(buffer[x][y] < 1)
            {
                buffer[x][y] = 0;    
            }
            
            if(changed[x][y] || obstacles[x][y] || levels[x][y] < 1)
            {
                continue;   
            }
            
            if(isValid(x, y + 1))
            {
                if(!obstacles[x][y + 1])
                {
                    if(levels[x][y + 1] < 1)
                    {
                        float diff = min(255 - levels[x][y +1], levels[x][y]);
                        
                        if(diff > 1)
                        {
                            buffer[x][y] -= diff;
                            buffer[x][y + 1] += diff;
                            changed[x][y] = true;
                            changed[x][y + 1] = true;
                        }
                        continue;
                    }
                    else
                    {
                        float amountInSpaceBelow = levels[x][y + 1];
                        float spaceBelow = 255 - levels[x][y + 1];
                        
                        if(spaceBelow > 0)
                        {
                            if(amountInSpaceBelow <= spaceBelow)
                            {
                                buffer[x][y + 1] += buffer[x][y];
                                buffer[x][y] = 0;
                                changed[x][y] = true;
                                changed[x][y + 1] = true;
                                continue;
                            }
                            else
                            {
                                buffer[x][y + 1] += spaceBelow;
                                buffer[x][y] -= spaceBelow;
                                changed[x][y] = true;
                                changed[x][y + 1] = true;
                            }
                        }
                    }
                }   
            }
            
            boolean leftIsValid= isValid(x - 1, y) && !obstacles[x - 1][y];
            boolean rightIsValid = isValid(x + 1, y) && !obstacles[x + 1][y];
            
            float fluidLeft = buffer[x][y];
            boolean doneFlowing = false;
            boolean didAnyFluidMove = false;
            buffer[x][y] = max(min(buffer[x][y], 255.0f), 0.0f);
            for(int i = 0; i < 2 && fluidLeft > 1; i++)
            {
                boolean didFlow = false;
  
                float leftSpace = 0.0f;
                float rightSpace = 0.0f;
                
                if(leftIsValid)
                {
                    leftSpace = min(255.0f - buffer[x - 1][y], buffer[x][y]);   
                }
                
                if(rightIsValid)
                {
                    rightSpace = min(255.0f - buffer[x + 1][y], buffer[x][y]);   
                }
                
                if(flow[x][y] > 0)
                {

                    if(leftIsValid && buffer[x - 1][y] <= fluidLeft && leftSpace > 1)
                    {
                        buffer[x - 1][y] += leftSpace * 0.5f;
                        fluidLeft-= leftSpace * 0.5f;
                        
                        buffer[x][y] = min(max(fluidLeft, 0), 255);
                        
                        doneFlowing = false;
                        didFlow = true;
                        flow[x][y] = 1;
                        changed[x][y] = true;
                        changed[x -1][y] = true;
                        flow[x - 1][y] = 1;
                        didAnyFluidMove = true;
   
                    } 
                    
                    if(rightIsValid && buffer[x +1][y] <= fluidLeft && rightSpace > 1)
                    {
                        
                        buffer[x + 1][y] += rightSpace * 0.5f;
                        fluidLeft-= rightSpace * 0.5f;
                        
                        buffer[x][y] = min(max(fluidLeft, 0), 255);
                        doneFlowing = false;

                        flow[x +1][y] = -1;
                        if(!didFlow)
                        {
                            flow[x][y] = -1;
                        }
                        
                        didFlow = true;
                        changed[x][y] = true;
                        changed[x + 1][y] = true;
                        didAnyFluidMove = true;
                    }
                    
                } 
                else
                {
    
                    if(rightIsValid && buffer[x +1][y] <= fluidLeft && rightSpace > 1)
                    {
                       
                        buffer[x + 1][y] += rightSpace * 0.5f;
                        fluidLeft-= rightSpace * 0.5f;
                        
                        buffer[x][y] = min(max(fluidLeft, 0), 255);
                        
                        doneFlowing = false;
                        didFlow = true;
                        flow[x][y] = -1;
                        changed[x][y] = true;
                        changed[x + 1][y] = true;
                        flow[x + 1][y] = -1;
                        didAnyFluidMove = true;
                    }
                    
                    if(leftIsValid && buffer[x - 1][y] <= fluidLeft && leftSpace > 1)
                    {
                        buffer[x - 1][y] += leftSpace * 0.5f;
                        fluidLeft-= leftSpace * 0.5f;
                        
                        buffer[x][y] = min(max(fluidLeft, 0), 255);
                        doneFlowing = false;
                        flow[x - 1][y] = 1;
                        if(!didFlow)
                        {
                            flow[x][y] = 1;
                        }
                        didFlow = true;
                        changed[x][y] = true;
                        changed[x - 1][y] = true;
                        didAnyFluidMove = true;
                    } 
                }
                
                if(fluidLeft < 1 || !didFlow)
                    doneFlowing = true;
            }


            if(!didAnyFluidMove)
            {
                flow[x][y] *= -1;   
            }
            
            if(fluidLeft < 1)
            {
                flow[x][y] = random(-10, 10);  
                changed[x][y] = true; 
            }
           
        }
    }   
    
    
    
    
    for(int x = 0; x < SIZE_X; x++)
    {
        for(int y = 0; y < SIZE_Y; y++)
        {
            if(buffer[x][y] < 1)
            {
                buffer[x][y] = 0;    
            }
            
            if(buffer[x][y] > 255)
            {
                buffer[x][y] = 255;   
            }
            
            levels[x][y] = buffer[x][y];
            
            if(levels[x][y] < 2)
            {
                if(random(0, 10) < 2)
                {
                    levels[x][y] = 0;   
                }
            }
        
        
            if(changed[x][y] || firstIter)
            {
                if(levels[x][y] > 0)
                {
                    fill(255 - levels[x][y],255 - levels[x][y], levels[x][y]);
                    noStroke();
                    float n = levels[x][y] / 255.0f;
                    rect(x * s, y * s + (1.0f - n) *s, s, n*s);
                }
                else
                {
                    fill(0, 0, 0);
                    noStroke();
                    rect(x * s, y * s, s, s);  
                }
                
                
                if(obstacles[x][y])
                {
                    fill(100, 255, 100);
                    noStroke();
                    rect(x * s, y * s, s, s);
                }
            }
        }
    }
   firstIter = false;
    

    
    
}


