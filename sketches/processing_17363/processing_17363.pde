
// Geomerative
import geomerative.*;
// JBox2D
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;
// BoxWrap2D
import org.jbox2d.p5.*;

RFont font;
Physics physics;

void setup()
{
    size( 640, 480 );
    smooth();

    initPhysics();

    initGeomerative();
}

void draw()
{
}

void initPhysics ()
{
    physics = new Physics(this, width, height);
    physics.setCustomRenderingMethod(this, "renderScene");
}

void initGeomerative ()
{
    RG.init(this);
    RCommand.setSegmentLength(10);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

    font = new RFont( "lucon.ttf", 190, RFont.CENTER);
    RShape shp = font.toShape("Hello");

    physics.setDensity(1);
    int sID = 0;
    
    for ( RShape s : shp.children )  // glyphs
    {
        for ( RPath path : s.paths )  // glyph parts
        {
            UserData uData = new UserData(++sID);
        
            RPoint[] points = path.toPolygon().getPoints();
        
            Body body = null, lastBody = null, firstBody = null;
            RPoint p = null;
            for ( int i = 0; i < points.length; i++ ) // glyph part points
            {
                p = points[points.length-1-i];
                
                body = physics.createCircle( width/2 + p.x, height/2 + p.y, 2 );  // point of glyph
                body.setLinearVelocity( new Vec2( 0, 10 ) );
                body.setUserData( uData );
                
                for  ( int ii = 0; ii < 2; ii++ ) // a "filling", not rendered
                {
                    Body b = physics.createCircle( width/2 + p.x + 1, height/2 + p.y + 1, random(1,15) );
                    b.setLinearVelocity( new Vec2( random(-2,2), random(-2,2) ) );
                }
                
                if ( lastBody != null )
                {
                    JointUtils.createDistanceJoint( lastBody, body ); // connect the dots of glyph part
                }
                else
                {
                    firstBody = body;
                }
                lastBody = body;
            }
            JointUtils.createDistanceJoint( lastBody, firstBody ); // close glyph part
        }
    }
}

void renderScene ( World world )
{
    background( 255 );
    
    Vec2 lPos = null, pos = null;
    int shapeID = -1;
    
    Body body = world.getBodyList();
    do // loop thru bodies
    {
        UserData uData = (UserData)body.getUserData();
        
        if ( uData == null ) // then it's not part of the glyphs
        {
            Shape shape = body.getShapeList();
            
            // inflate the circle
            if ( shape != null && shape.getType() == ShapeType.CIRCLE_SHAPE )
            {
                CircleShape circle = (CircleShape) shape;
                circle.m_radius = circle.getRadius() * random(1.0001, 1.01);
                
                // too large? pop it ..
                if ( physics.worldToScreen( circle.m_radius ) > 30 )
                    physics.removeBody( body );
            }
            
            continue; // jump to new body in loop
        }
        else
        {
            if ( uData.shapeID != shapeID ) // this is a new shape!
            {
                shapeID = uData.shapeID;
                if ( lPos != null && pos != null )
                {
                    line( lPos.x, lPos.y, pos.x, pos.y ); // close shape
                }
                lPos = null; // start new one
            }
        }
        
        Shape shape = body.getShapeList();
        do // loop thru shapes
        {
            if ( shape.getType() == ShapeType.CIRCLE_SHAPE )
            {
                CircleShape circle = (CircleShape) shape;
                pos = physics.worldToScreen( body.getWorldPoint( circle.getLocalPosition() ) );
                
                if ( physics.worldToScreen( circle.m_radius ) < 20 )
                    // inflate
                    circle.m_radius = circle.getRadius() * random(1.0005, 1.0035);
                else
                {
                    // washing mashine
                    Vec2 vel = body.getLinearVelocity();
                    vel.x = cos(frameCount / 90.0) * -20;
                    vel.y = sin(frameCount / 90.0) * -20;
                    body.setLinearVelocity(vel);
                }
                
                if ( lPos != null )
                {
                    line( lPos.x, lPos.y, pos.x, pos.y );
                }
                
                lPos = pos;
            }
            
        } while ( (shape = shape.getNext()) != null ); // shapes ..
        
    } while ( (body = body.getNext()) != null ); // bodies ..
}

class UserData
{
    int shapeID = -1;
    UserData ( int i ) { shapeID = i; }
}

void keyPressed ()
{
    if ( key == ' ' )
    {
        physics.destroy();
        initPhysics();
        initGeomerative();
    }
}


