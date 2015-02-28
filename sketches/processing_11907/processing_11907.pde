
public class BooleanGrid3D {

    int sizex, sizey, sizez;
    boolean grid[][][];

    public BooleanGrid3D(int sizex, int sizey, int sizez) {
        this.sizex = sizex;
        this.sizey = sizey;
        this.sizez = sizez;
        grid = new boolean[sizex][sizey][sizez];
    }

    public boolean get(int x, int y, int z) {
        return grid[x][y][z];
    }

    public void set(int x, int y, int z, boolean value) {
        grid[x][y][z] = value;
    }

    public int getNeighbours26(int x, int y, int z) {
        int count = 0;
        for (int oz = -1; oz <= 1; oz++) {
            for (int oy = -1; oy <= 1; oy++) {
                for (int ox = -1; ox <= 1; ox++) {
                    if (oz == 0 && oy == 0 && ox == 0)
                        continue;
                    if (get(wrap(x + ox, sizex), wrap(y + oy, sizey), wrap(z + oz, sizez))) {
                        count++;
                    }
                }
            }
        }
        return count;
    }

    private int wrap(int c, int size) {
        if (c < 0) {
            return size + c;
        } else if (c > size - 1) {
            return c - size;
        } else {
            return c;
        }
    }
}


