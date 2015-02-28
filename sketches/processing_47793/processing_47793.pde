
int _grid = 10; // global veriable which can be used in any function

void setup(){
    size(301, 301);
    background(0);
    frameRate(24);
    stroke(255);
}

void draw(){
    if(_grid <= 100){
    background(0);
    for (int y = 0; y <= 700; y += _grid) {
    for (int x = 0; x <= 1200; x += _grid) {
    line(x, y, x + _grid, y + _grid);
    line(x + _grid, y, x, y + _grid);
    line(x, y, x + _grid, y);
    line(x, y, x, x + _grid);
    }
    }
    _grid++;
    }
}     

                                    
