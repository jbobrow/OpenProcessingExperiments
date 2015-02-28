
size(1001, 1001);

int grid = 20; 
for (int y = 0; y <= 1000; y += grid) {
    for (int x = 0; x <= 1000; x += grid) {
    line(x, y, x + grid, y + grid);
    line(x + grid, y, x, y + grid);
    line(x, y, x + grid, y);
    line(x, y, x, x + grid);
    }
}
                                    
