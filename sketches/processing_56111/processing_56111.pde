
//
// http://www.algorithmist.com/index.php/Monotone_Chain_Convex_Hull.java
//
// This is an implementation of Monotone Chain Convex Hull algorithm in Java.
// It takes O( NlogN ) in sorting & O(N) in actual convex hull finding for N points.
//

class Point implements Comparable<Point>
{
	int x,y;
	Point(int x, int y)
	{
		this.x = x;
		this.y = y;
	}
 
	// sort first on x then on y
	public int compareTo(Point other)     
	{
		if( x == other.x) 
			return y - other.y;
		else 
			return x - other.x;
	}
 
        // cross product of two vectors
	public int cross( Point p)
	{
		return x * p.y - y * p.x;
	}
 
        // subtraction of two points
	public Point sub( Point p)
	{
		return new Point( x - p.x, y - p.y );
	}

        public String toString()
        {
          return "Point[x=" + x + ",y=" + y + "]";
        }
}
 
// Each point passed in via the "points" array should be unique.
// If duplicates are passed in the returned polygon might not be a convex hull. 
public Point[] findHull( Point[] points)
{
	int n = points.length;
	Arrays.sort( points);
	Point[] ans = new Point[2 * n];		        // In between we may have a 2n points
	int k = 0;
	int start = 0;					// start is the first insertion point
 
 
 
	for(int i = 0; i < n; i ++)                     // Finding lower layer of hull
	{
		Point p = points[i];
		while( k - start >= 2 && p.sub( ans[k-1] ).cross(p.sub( ans[k-2] ) ) > 0 )
			k--;
		ans[k++] = p; 
	}
 
	k--; 						// drop off last point from lower layer
	start = k ;						
 
	for(int i = n-1 ; i >= 0 ; i --)                // Finding top layer from hull
	{
		Point p = points[i];
		while( k - start >= 2 && p.sub( ans[k-1] ).cross(p.sub( ans[k-2] ) ) > 0 )
			k--;
		ans[k++] = p; 
	}
	k--;						// drop off last point from top layer
 
	return Arrays.copyOf(ans, k);                   // convex hull is of size k
}

