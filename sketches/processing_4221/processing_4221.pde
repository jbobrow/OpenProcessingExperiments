
Node[] nodes;
float[][] connections;
int numNodes = 20, maxSize = 20; // numNodes must be larger than maxSize


void setup()
{   
    size(500, 500);
    smooth();
    stroke(255, 255, 255, 10);
    frameRate(100);
    ellipseMode(RADIUS);

    connections = new float[numNodes][numNodes];
    
    for(int k = 0; k < numNodes; k++)
    {
        for(int l = 0; l < numNodes; l++)
        {
            connections[k][l] = 0;
        }
    }
    
    nodes = new Node[numNodes];
    
    for(int i = 0; i < numNodes; i++)
    {
        nodes[i] = new Node();
    }
}

void draw()
{
    background(52);
    for(int i = 0; i < numNodes; i++)
    {
        nodes[i].move();
        connect();
        nodes[i].render();
    }
}

void connect()
{
    for(int i = 0; i < numNodes; i++)
    {
        nodes[i].radius= 1;
        for(int j = 0; j < numNodes; j++)
        {
            if((PVector.dist(nodes[i].position, nodes[j].position) < 200))
            {
                line(nodes[i].position.x, nodes[i].position.y, nodes[j].position.x, nodes[j].position.y);
                connections[i][j] =1;
                if(connections[i][j] == 1)
                {
                    if(nodes[i].radius < maxSize)
                    {
                         nodes[i].radius += connections[j][i]*(maxSize/numNodes);
                    }
                }
            }
        }
    }
}


