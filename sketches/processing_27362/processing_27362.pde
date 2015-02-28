
import java.awt.Rectangle;

public class ImageQuadrification {
    
    public RectEx[] process( PImage img ) {
        return process( img, 0x20, 4 );
    }

    public RectEx[] process( PImage img, int threshold ) {
        return process( img, threshold, 4 );
    }
    
    public RectEx[] process( PImage img, int threshold, int min_size ) {
        RectEx[] rects = new RectEx[1];
        rects[0] = new RectEx(0,0,img.width,img.height);

        boolean hasChangedAnything = true;
        RectEx r;

        while( hasChangedAnything ) {        
            hasChangedAnything = false;
            for ( int i = 0; i < rects.length; i++ ) {
                r = rects[i];
                if ( r.width <= min_size || r.height <= min_size ) continue;
                if (isRegionUniform(img,r,threshold)== false) {
                    rects = (RectEx[])replaceItemWithArray(rects,i,divide(r));
                    i+=4;
                    hasChangedAnything = true;
                }
            }
        }

        return rects;
    }

    private Object[] replaceItemWithArray( Object[] arr, int index, Object[] newItems ) {
        Object[] answer;
        Object[] left =  (Object[]) subset( arr, 0, index );
        answer = (Object[])concat(left,newItems);
        if ( index < arr.length-1 ) {
            Object[] right = (Object[]) subset( arr, index+1, arr.length-index-1 );    
            answer = (Object[])concat(answer,right);
            right = null;
        }
        left = null;
        return answer;
    }

    private boolean isRegionUniform( PImage img, Rectangle r, int threshold ) {
        int left = r.x;
        int right = r.x + r.width;
        int top = r.y;
        int bottom = r.y + r.height;

        int initialPixel = img.pixels[r.y*img.width+r.x];
        int currentPixel;
        for ( int j = top; j < bottom; j++ ) {
            for ( int i = left; i < right; i++ ) {
                currentPixel = img.pixels[j*img.width+i];
                if (abs(red(initialPixel)-red(currentPixel)) > threshold || 
                    abs(green(initialPixel)-green(currentPixel)) > threshold ||
                    abs(blue(initialPixel)-blue(currentPixel)) > threshold ) {
                    return false;
                }
            }
        }
        return true;
    }
    
    private RectEx[] divide(RectEx r) {
            RectEx[] rects = new RectEx[4];
            int w2 = int(r.width * 0.5);
            int h2 = int(r.height * 0.5);
            int x = r.x;
            int y = r.y;
            rects[0] = new RectEx( x,y,w2,h2 );
            rects[1] = new RectEx( x+w2,y,r.width-w2,h2 );
            rects[2] = new RectEx( x+w2,y+h2,r.width-w2,r.height-h2 );
            rects[3] = new RectEx( x,y+h2,w2,r.height-h2 );
            return rects;
    }
}

public class RectEx extends Rectangle implements Comparable {
    public int colorVal;

    RectEx( int x, int y, int width, int height ) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }

    int compareTo( Object o ) {
        Rectangle otherR = (Rectangle)o;
        int otherSize = otherR.width*otherR.height;
        int mySize = width*height;
        if ( mySize > otherSize ) return 1;
        else if ( mySize < otherSize ) return -1;
        else return 0;
    }
}


