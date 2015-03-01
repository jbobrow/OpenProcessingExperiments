
float grid[][];
int res = 10, lightRes = 8;
int w, h;

void setup() {
    size(300, 300);
    w = width/res;
    h = height/res;
    grid = new float[w][h];
}

void draw(){
    renderGrid();
    /*for(int i = 1; i < w-1; i++) {
        for(int j = 1; j < h-1; j++) {
            float delta = random(-1,1);
            float sum = grid[i][j];
            float average;
            
            for(int x = -1; x <= 1; x++) {
                for(int y = -1; y <= 1; y++) {
                    if(x==0 && y==0)continue;
                    sum += grid[i+x][j+y];
                }
            }
            average = sum/9;
            grid[i][j] = average+delta;
        }
    }*/
}

void mousePressed() {
    renderGrid();
    for(int i = 1; i < w-1; i++) {
        for(int j = 1; j < h-1; j++) {
            float delta = random(-1,1);
            float sum = 0;
            float average;
            
            sum += grid[i-1][j-1];
            sum += grid[i-1][j];
            sum += grid[i-1][j+1];
            sum += grid[i][j+1];
            sum += grid[i][j-1];
            sum += grid[i+1][j-1];
            sum += grid[i+1][j];
            sum += grid[i+1][j+1];
            
            average = sum/8;
            grid[i][j] = average;
            
        }
    }
    int mx = int(mouseX); int my = int(mouseY);
    grid[mx][my] = 255;
}


void renderGrid() {
    for(int i = 0; i < w; i++) {
        for(int j = 0; j < h; j++) {
            fill(grid[i][j]);
            rect(i*res,j*res,res,res);
        }
    }
}
