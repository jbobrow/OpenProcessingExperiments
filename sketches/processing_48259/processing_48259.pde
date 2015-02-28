
ArrayList<Ally> allies;
ArrayList<Enemy> enemies;
Location[][] grid;
Location curLoc;
Location corner;
Ally selAlly = null;
Enemy selEnemy = null;
int gameState = 0;
int rectWidth = 40;
int rectHeight = 40;
void setup() { 
    size(400,400);
    set();
}

void set() {
    rectWidth = width / 10;
    rectHeight = height / 10;
    setGrid(10,10);
    curLoc = new Location(0,0);
    corner = new Location(0,0);
    allies = new ArrayList<Ally>();
    enemies = new ArrayList<Enemy>();
    addAllies(5);
    addEnemies(5);
}

void draw() { 
    noStroke();
    drawBack();
    drawAllies();
    drawEnemies();
}

void drawBack() {
    rectMode(CORNER);
    for (int a = 0; a < grid.length; a++) {
        for (int b = 0; b < grid[a].length; b++) {
            fill(grid[a][b].c1);
            rect((a + corner.row) * rectWidth,(b + corner.col) * rectHeight,rectWidth,rectHeight);                                                     if (curLoc.equals(a,b)) {
                fill(255,60);
                rect((a + corner.row) * rectWidth,(b + corner.col) * rectHeight,rectWidth,rectHeight);
            }
        }
    }
    for (int s = 0; s < allies.size(); s++) {
        if (allies.get(s).movePoss.size() > 0) {
            for (int a = 0; a < allies.get(s).movePoss.size(); a++) {
                fill(255,60);
                rect(allies.get(s).movePoss.get(a).row * rectWidth,allies.get(s).movePoss.get(a).col * rectHeight,rectWidth,rectHeight);
            }
        }
    }
    for (int s = 0; s < enemies.size(); s++) {
        if (enemies.get(s).movePoss.size() > 0) {
            for (int a = 0; a < enemies.get(s).movePoss.size(); a++) {
                fill(255,60);
                rect(enemies.get(s).movePoss.get(a).row * rectWidth,enemies.get(s).movePoss.get(a).col * rectHeight,rectWidth,rectHeight);
            }
        }
    }
}

void drawAllies() {
    rectMode(CENTER);
    for (int a = allies.size() - 1; a >= 0; a--) {
        allies.get(a).draw();
    }    
}

void drawEnemies() {
    rectMode(CENTER);
    for (int a = enemies.size() - 1; a >= 0; a--) {
        enemies.get(a).draw();
    }    
}

void keyReleased() {
    if (key == 'x') {
        resetCharacters();
    }
}

void keyPressed() {
    switch (keyCode) {
        case 37:
            swapLeft();
            break;
        case 38:
            swapUp();
            break;
        case 39:
            swapRight();
            break;
        case 40:
            swapDown();
            break;
    }
    boundChecks();
    if (key == 'z') {
        confirm();
    }
    if (key == 'x') {
        back();
    }    
}

void swapLeft() {
    switch (gameState) {
        case 0:
            curLoc.add(-1,0);
            break;
    }
}

void swapRight() {
    switch (gameState) {
        case 0:
            curLoc.add(1,0);
            break;
    }
}

void swapUp() {
    switch (gameState) {
        case 0:
            curLoc.add(0,-1);
            break;
    }
}

void swapDown() {
    switch (gameState) {
        case 0:
            curLoc.add(0,1);
            break;
    }        
}

void confirm() {
    if (selAlly == null) {
        resetCharacters();
        setAlly();
    }
    else {
        if (checkMovePoss()) {
            for (int a = 0; a < allies.size(); a++) {
                if (selAlly.loc.equals(allies.get(a).loc)) {
                    allies.get(a).loc.set(curLoc);
                    resetCharacters();
                    //bring up menu
                }
            }
        }
    }
}

void back() {
    resetCharacters();
    setAlly();
    selAlly = null;
    setEnemy();
}

boolean checkMovePoss() {
    for (int a = 0; a < selAlly.movePoss.size(); a++) {
        if (curLoc.equals(selAlly.movePoss.get(a))) {
            return true;
        }
    }
    return false;
}

void resetCharacters() {
    for (int a = 0; a < allies.size(); a++) {
        allies.get(a).resetMovePoss();
    }
    for (int a = 0; a < enemies.size(); a++) {
        enemies.get(a).resetMovePoss();
    }
}

void setAlly() {
    for (int a = 0; a < allies.size(); a++) {
        if (curLoc.equals(allies.get(a).loc)) {
            selAlly = allies.get(a);
            allies.get(a).calculateMovePoss();
        }
    }
}

void setEnemy() {
    for (int a = 0; a < enemies.size(); a++) {
        if (curLoc.equals(enemies.get(a).loc)) {
            selEnemy = enemies.get(a);
            enemies.get(a).calculateMovePoss();
        }
    }
}

void boundChecks() {
    if (curLoc.row < 0) {
        curLoc.set(0,curLoc.col);
    }
    if (curLoc.row >= grid.length) {
        curLoc.set(grid.length - 1,curLoc.col);
    }
    if (curLoc.col < 0) {
        curLoc.set(curLoc.row, 0);
    }
    if (curLoc.col >= grid[0].length) {
        curLoc.set(curLoc.row, grid[0].length - 1);
    }
}

void setGrid(int x, int y) {
    grid = new Location[x][y];
    for (int a = 0; a < grid.length; a++) {
        for (int b = 0; b < grid[a].length; b++) {
            grid[a][b] = new Location(a,b,(int)random(10));
        }
    }
}

void addAllies(int s) {
    for(int a = 0; a < s; a++) {
        allies.add(new Ally((int)random(grid.length),(int)random(grid[0].length),random(3)));
    }
}

void addEnemies(int s) {
    for(int a = 0; a < s; a++) {
        enemies.add(new Enemy((int)random(grid.length),(int)random(grid[0].length),random(3)));
    }
}


class Location {
    String ty;
    color c1;
    int type;
    int row;
    int col;
    int total = 0;
    
     Location(int x, int y) {
        row = x;
        col = y;
        type = null;
    }
    
    Location(int x, int y, int t) {
        row = x;
        col = y;
        type = t;
        setType(t);
    }
    
    Location(Location l) {
        this.row = l.row;
        this.col = l.col;
        this.type = l.type;
        this.total = l.total;
    }
    
    void set(Location l) {
        this.row = l.row;
        this.col = l.col;
    }
    
    public void setType(int t) {
        switch (t) {
            case 0:
                c1 = color(90,110,150);
                ty = "sea";
                break;
            case 1:
                c1 = color(90);
                ty = "mountain";
                break;
            default:
                c1 = color(90,170,130);
                ty = "grass";
                break;
        }
    }
    
    public void add(int x, int y) {
        row += x;
        col += y;
    }
    
    public void set(int x, int y) {
        row = x;
        col = y;
    }
    
    public boolean equals(Location l) {
        return this.row == l.row && this.col == l.col;
    }
    
    public boolean equals(int x, int y) {
        return this.row == x && this.col == y;
    }
    
    public void setTotal(int t) {
        total = t;
    }
    
    public int getTotal() {
        return total;
    }
    //make it so that it returns based on both types
    public int getMoveCost(int t) {
        return 1;
    }
}

class Ally{
    Location loc;
    int type;
    color c1 = color(100,150,120);
    int moveAmount = 3;
    ArrayList<Location> movePoss = new ArrayList<Location>();
    
    Ally(int x, int y, int t) {
        loc = new Location (x,y);
        type = t;
    }          
    
    //might make draws seperate for different states
    void draw() {
        fill(c1);
        rect(loc.row * rectWidth + rectWidth / 2,loc.col * rectHeight + rectHeight / 2,rectWidth / 2,rectHeight / 2);
    }
    
    void calculateMovePoss() {
        movePoss = new ArrayList<Location>();
        ArrayList<Location> open = new ArrayList<Location>();
        ArrayList<Location> closed = new ArrayList<Location>();
        open.add(loc);
        for (int i = 0; i < grid.length; i++) {
            for (int o = 0; o < grid[i].length; o++) {
                grid[i][o].setTotal(0);
            }
        }
        while (open.size() > 0) {
            Location a = new Location(open.get(0));
            int curCost = open.get(0).getTotal();
            for (int x = a.row - 1; x <= a.row + 1; x++) {
                for (int y = a.col - 1; y <= a.col + 1; y++) {
                    if (x >= 0 && x < grid.length && y >= 0 && y < grid[x].length) {
                        if ((abs(x - a.row) + abs(y - a.col)) == 1) {
                            if (!checkClosed(closed,grid[x][y]) && !checkEnemy(grid[x][y])) {
                                int cost = grid[x][y].getMoveCost(type);
                                if (curCost + cost <= moveAmount) {
                                    grid[x][y].setTotal(curCost + cost);
                                    open.add(grid[x][y]);
                                }
                            }
                        }
                    }
                }
            }
            closed.add(a);
            movePoss.add(a);
            open.remove(0);
        }
    }
    
    boolean checkClosed(ArrayList<Location> locs, Location a) {
        if (locs.size() > 0) {
            for (int i = 0; i < locs.size(); i++) {
                if (a.equals(locs.get(i))) {
                    return true;
                }
            }
        }
        return false;
    }
    
    boolean checkEnemy(Location a) {
        for (int i = 0; i < enemies.size(); i++) {
            if (a.equals(enemies.get(i).loc)) {
                return true;
            }
        }
        return false;
    }
    
    
    void resetMovePoss() {
        movePoss = new ArrayList<Location>();
    }
}                     


class Enemy{
    Location loc;
    int type;
    color c1 = color(240,130,120);
    int moveAmount = 4;
    ArrayList<Location> movePoss = new ArrayList<Location>();
    
    Enemy(int x, int y, int t) {
        loc = new Location (x,y);
        type = t;
    }          
    
    //might make draws seperate for different states
    void draw() {
        fill(c1);
        rect(loc.row * rectWidth + rectWidth / 2,loc.col * rectHeight + rectHeight / 2,rectWidth / 2,rectHeight / 2);
    }
    
    void calculateMovePoss() {
        movePoss = new ArrayList<Location>();
        ArrayList<Location> open = new ArrayList<Location>();
        ArrayList<Location> closed = new ArrayList<Location>();
        open.add(loc);
        for (int i = 0; i < grid.length; i++) {
            for (int o = 0; o < grid[i].length; o++) {
                grid[i][o].setTotal(0);
            }
        }
        while (open.size() > 0) {
            Location a = new Location(open.get(0));
            int curCost = open.get(0).getTotal();
            for (int x = a.row - 1; x <= a.row + 1; x++) {
                for (int y = a.col - 1; y <= a.col + 1; y++) {
                    if (x >= 0 && x < grid.length && y >= 0 && y < grid[x].length) {
                        if ((abs(x - a.row) + abs(y - a.col)) == 1) {
                            if (!checkClosed(closed,grid[x][y]) && !checkAlly(grid[x][y])) {
                                int cost = grid[x][y].getMoveCost(type);
                                if (curCost + cost <= moveAmount) {
                                    grid[x][y].setTotal(curCost + cost);
                                    open.add(grid[x][y]);
                                }
                            }
                        }
                    }
                }
            }
            closed.add(a);
            movePoss.add(a);
            open.remove(0);
        }
    }
    
    boolean checkClosed(ArrayList<Location> locs, Location a) {
        if (locs.size() > 0) {
            for (int i = 0; i < locs.size(); i++) {
                if (a.equals(locs.get(i))) {
                    return true;
                }
            }
        }
        return false;
    }
    
    boolean checkAlly(Location a) {
        for (int i = 0; i < allies.size(); i++) {
            if (a.equals(allies.get(i).loc)) {
                return true;
            }
        }
        return false;
    }
    
    void resetMovePoss() {
        movePoss = new ArrayList<Location>();
    }
}                                                                                                                                                                                                                       
