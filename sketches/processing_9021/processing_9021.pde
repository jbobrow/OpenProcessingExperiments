
/** \class DisplayManager
\brief DisplayManager - Graphical display management.

\par Class to manage background, scale references, grids and other
This class was originally developed by \a Melvin \a Ochsmann from Malmo University
under the name \c DisplayItems with a set of functions to display essential items
on a background screen window. \n 
Actually I developed this more complete version used in conjunction with Skope. Still
this class is completely independent by the application program and can be used in every
application. Follow the documentation instructions and use the program as an
example to test the class capabilities.

\note   DisplayManager needs some variables definition in the main program to work fine.
The library also usea a specific font that you can customize as you like. Font files are
stored in \c Data directory of your processing sketch and actually the choice is between
\c BitstreamVeraSansMono and \c Monaco fonts. \n 
All the parameters subject to customization are defined as variables in the class to 
simplify every change.


\author Created by \a Enrico \a Miglino  - Ahead Tech Labs \n 
        Documentation review by \a Maria \a Antonietta \a Ricagno \n 
        Infos and contacts: enrico.miglino@ovi.com \n 
        Thanks to \a Melvin \a Ochsmann who developed DisplayManager and 
        released the class file under Copyleft license.
  
\version 1.0

\date 19 april 2010

\note This program is released under Creative Commons GNU License and all the documentation
      is released under Creative Commons License CC-NY-SA 3.0.
      (c) 2010 Enrico Miglino - Ahead Tech Labs

*/
class DisplayManager
{
    /** \var fontVeraSans
    Bitmap font file name definition. Use this name in \c loadFont 
    function below if needed.
    */
    String fontVeraSans = "BitstreamVeraSansMono-Roman-25.vlw";
    /** \var fontMonaco
    Bitmap font file name definition. Use this name in \c loadFont 
    function below if needed.
    */
    String fontMonaco = "Monaco-14.vlw";

    PFont font;                 //! \var font pointer object (where font is loaded)
    int gridsize;               //! \var size for the grid on the background
    int gridcolor;              //! \var color for the background grid
    int backcolor;              //! \var color for the window background
    int fontcolor;              //! \var color for the font.
                                //! Better if lighten than the grid color.
    int fontsize = 10;          //! \var size for the displayed font
    String fontname = fontVeraSans; //! \var font assignement
    String empty = "";          //! \var empty string
    int i;                      //! \var integer
    float scaleUnit;            //! \var unit value to represent the correct scale value on the y-axis

    /** \brief DisplayManager() set font, fontsize and grid size
    
    The constructor set fontname using one of the font files defined above
    
    \note Only one of the possible bitmap fonts can be loaded by the constructor
    
    \par Grid and Font size formula
    Font size varies depending on the grid size. Indeed, the grid size represents a fixed
    reference depending on the window dimensions and is square-sized. Data scale
    does not depend on the grid. Font dimension is calculated to have
    a good readability against the background grid.
    
    -# Load selected bitmap font file
    -# Calculate a gridsize based on gridfactor
    -# Set fontsize as follows:
        - gridsize <= 20        fontsize=10
        - 20 > gridsize <= 48   fontsize=14
        - gridsize > 48         fontsize=22
    */
    DisplayManager()
        {
        font = loadFont(fontname);
        gridsize = (width / 2) / gridfactor + (height / 2) / gridfactor;
        if (gridsize <= 20) fontsize = 10;
        if ((gridsize > 20) && (gridsize <= 48)) fontsize = 14;
        if(gridsize > 48) fontsize = 22;
        textFont(font, fontsize);
        }

    /** \brief initStuff() initialize font, fontsize and gridsize
    
    This function repeats the same initialization of the constructor
    \c DisplayManager() and should be called by the program when 
    gridfactor change.
    */
    void initStuff()
        {
        font = loadFont(fontname);
        gridsize = (width / 2) / gridfactor + (height / 2) / gridfactor;
        if (gridsize <= 20) fontsize = 10;
        if ((gridsize > 20) && (gridsize <= 48)) fontsize = 14;
        if(gridsize > 48) fontsize = 22;
        textFont(font, fontsize);
        }

    /** \brief drawBack() draw background black or color
    
    The drawing mode depends by the flag state \c bck
    */
    void drawBack()
        {
        background( (bck) ? (colBackgnd) : (0)  );
        }
    
    /** \brief void writeData() write on-screen data values

    To draw on-screen text the font size and color are the same used to draw scale values.
    The output values are fixed on a special screen area starting from a variable offset,
    defined as initial parameter by the invoking program.
    
    \todo Complete writeData function for correct text visualization.
    */
    void writeData()
        {
        int xT, yT;         //! \var x and y positions for on-screen text
        if(textScreen)
            {
            for (i=0; i<recFields; i++)
                {
                xT = xTextOffset;
                yT = yTextOffset + (i * gridsize);
                text("On-screen data Channel " + i + " not yet complete !!! Sorry", xT, yT);
                // text("Channel " + i + " = " + inValue[i], xT, yT);
                }
            }
        }

    /** \brief drawItems draw grid and other items on the screen
    
    The invoking program can set the kind of grid to draw changing
    the following flags:
    
        - grid=false     do not draw grid
        - g_vert=true    draw vertical lines
        - g_horiz=true   draw horizontal lines
    
    The grid is drawn with a stroke defined in gridStroke while gridsize
    is initially set by the constructor function to the default value
    but can be changed by the user while the program is running.
    */
    void drawItems()
        {
        /** Everytime the function is invoked reassign the stroke for the grid.
            because this value can be changed by the program
        */
        strokeWeight(gridStroke);
        /** \brief Draw grid lines and scale values if flags are set

        If the grid flags are set for horizontal, vertical or both line drawing,
        drawing lines draw also scale values. If the grid is unset then scale 
        flag is checked independently.\n 
        Doing so, we obtain - with only three different flag setting - a complete
        set of options, as detailed in the following scheme:
        
        -# grid is set: draw square reference grid and if text is set draw 
        scale values as well
        -# only one line is set: draw only horizontal or vertical lines and
        if the text is set draw the corresponding scale value as well.
        -# grid is not set: if the text is set, draw both the scale values, else
        draw nothing (background only)
        
\note   The draw process for Y-Axis scale values converts in a convenient way
        height pixel values (corresponding to horizontal line positions) to 
        the data scale factor, resulting in a right value scaling representation.
        */
        
        if(grid)
            {
            if(g_vert)
                {
                for (i=0; i < width; i+=gridsize)
                    {
                    stroke(colGrid);
                    line(i, 0, i, height);
                    textAlign(LEFT);
                    fill(colUnits);
                    if (g_values && i%(2*gridsize)==0 && i < (width-(width/10))) text( empty+i, (i+fontsize/4), 0+fontsize);
                    }
                }
            if(g_horiz)
                {
                for (int i=0; i < height; i+=gridsize)
                    {
                    stroke(colGrid);
                    line(0, i, width, i);
                    textAlign(LEFT); 
                    fill(colUnits);
                    scaleUnit = map((float)(height-i), 0, height, minScale, maxScale);
                    scaleUnit = (int)(scaleUnit * 100) / 100;
                    if (g_values && i%(2*gridsize)==0) text( empty+scaleUnit, 0+(fontsize/4), i-(fontsize/4));
                    }
                }
            }
        else
            {
            for (i=0; i < width; i+=gridsize)
                {
                textAlign(LEFT);
                fill(colUnits);
                if (g_values && i%(2*gridsize)==0 && i < (width-(width/10))) text( empty+i, (i+fontsize/4), 0+fontsize);
                }
            for (i=0; i < height; i+=gridsize)
                {
                textAlign(LEFT); 
                fill(colUnits);
                scaleUnit = map((float)(height-i), 0, height, minScale, maxScale);
                scaleUnit = (int)(scaleUnit * 100) / 100;
//                if (debug) map((float)(height-i), 1, height, minScale, maxScale);
                if (g_values && i%(2*gridsize)==0) text( empty+scaleUnit, 0+(fontsize/4), i-(fontsize/4));
                }
            }
        text("Skope 1.0 (c) 2010 enrico.miglino@ovi.com Ahead Tech Labs\nSoftware released under CC GNU lic. Docs under CC copyleft lic.", width - gridsize*25, height - gridsize);
        }
}// end class Display




