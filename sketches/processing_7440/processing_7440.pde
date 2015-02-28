
void setup()
{
    size(800,800);
    stroke(120,234,100);
    frameRate(30);
    background(0);
    currentString[0] = "G";
    currentString[1] = "X";
    currentString[2] = "E";
}

int prevDir = 1;
int X = 400;
int Y = 400;

String input = "F - F + F + F - F E";
String inputX = "X + Y G E";
String inputY = "G X - Y E";

String[] rule = splitTokens(input);
String[] ruleX = splitTokens(inputX);
String[] ruleY = splitTokens(inputY);
//String[] currentString = splitTokens(input);

String[] currentString = new String[3];

void drawLine(int x,int y)
{
    switch (prevDir)
    {
        case 0:
        {
            line(x,y,x,y-2);
            Y-=2;
            break;
        }
        case 1:
        {
            line(x,y,x+2,y);
            X+=2;
            break;
        }
        case 2:
        {
            line(x,y,x,y+2);
            Y+=2;
            break;
        }
        case 3:
        {
            line(x,y,x-2,y);
            X-=2;
            break;
        }
    }
}

void applyRules()
{
    background(0);
    index = 0;
    prevDir = 1;
    X = 400;
    Y = 400;
    String[] rule1 = shorten(rule);
    String[] ruleX1 = shorten(ruleX);
    String[] ruleY1 = shorten(ruleY);
     
    String[] temp = new String[1];
        
    for (int i = 0; i < currentString.length; i++)
    {
        if (currentString[i].equals("F"))
        {
            int j = 0;
            while (!rule[j].equals("E"))
            {
                temp = append(temp,rule1[j]);
                j++;
            }
        }
        else if (currentString[i].equals("X"))
        {
          int j = 0;
          while (!ruleX[j].equals("E"))
          {
            temp = append(temp,ruleX1[j]);
            j++;
          }
        }
        else if (currentString[i].equals("Y"))
        {
          int j = 0;
          while (!ruleY[j].equals("E"))
          {
            temp = append(temp,ruleY1[j]);
            j++;
          }
        }
        else
        {
            temp = append(temp,currentString[i]);
        }
    }
    
    //temp = append(temp,"E");
    
    String[] temp1 = new String[temp.length-1];
    for (int i = 0; i < temp1.length ;i++)
    {
        temp1[i] = temp[i+1];
    }
    
    currentString  = temp1;
    //println(currentString);
} 

void draw()
{
    
}

int index = 0;


void keyReleased()
{
    if (currentString[index].equals("E"))
    applyRules();
    
    for (int i = 0; i < currentString.length; i++)
    {
        if (currentString[index].equals("F") || currentString[index].equals("G"))
        {
            drawLine(X,Y);
            index++;
        }
        else if (currentString[index].equals("-"))
        {
            prevDir--;
            index++;
            if (prevDir < 0)
            {    
                prevDir = 3;
            }
        }
        else if (currentString[index].equals("+"))
        {
            prevDir++;
            index++;
            if (prevDir >3 )
            {    
                prevDir = 0;
            }
        }
        else if (currentString[index].equals("X") || currentString[index].equals("Y"))
        index++;
        
    }
}


