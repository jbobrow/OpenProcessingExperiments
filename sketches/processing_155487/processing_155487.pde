
/*
Copyright (c) 2014 Ale González

This software is free; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License version 2.1 as published by the Free Software Foundation.

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General
Public License along with this library; if not, write to the
Free Software Foundation, Inc., 59 Temple Place, Suite 330,
Boston, MA 02111-1307 USA
*/

/**
 * BrightnessContrastController
 *
 * Shifts the global brightness and contrast of an image.
 *
 * Ported from Gimp's implementation, as explained by Pippin here:
 * http://pippin.gimp.org/image_processing/chap_point.html 
 * The following excerpts are from that--excellent btw--documentation:
 * "Changing the contrast of an image, changes the range of luminance values present. 
 *  Visualized in the histogram it is equivalent to expanding or compressing the histogram around the midpoint value. 
 *  Mathematically it is expressed as:
 *    new_value = (old_value - 0.5) × contrast + 0.5
 *  It is common to bundle brightness and control in a single operations, the mathematical formula then becomes:
 *   new_value = (old_value - 0.5) × contrast + 0.5 + brightness
 * The subtraction and addition of 0.5 is to center the expansion/compression of the range around 50% gray." 
 *
 * @author ale
 * @version 1.0
 */

class BrightnessContrastController
{        
    /**
    * Shifts brightness and contrast in the given image. Keeps alpha of the source pixels.
    * 
    * @param img
    *            Image to be adjusted.
    * @param brightness
    *            Value of the brightness adjustment. Integer in a range from -255 (all pixels to black) to 255 (all pixels to white). 0 causes no effect.
    * @param contrast
    *            Value of the contrast adjustment. Its range starts in 1f (no effect). Values over 1f increase contrast and below that value decrease contrast. Negative values will invert the image.
    */  
    public void destructiveShift(PImage img, int brightness, float contrast)
    {
        img.loadPixels();
        int l = img.pixels.length;
        
        //Variables to hold single pixel color and its components 
        int c = 0;
        int a = 0;
        int r = 0;
        int g = 0;
        int b = 0;
        
        for(int i = 0; i < l; i++)
        {
            c = img.pixels[i];
            a = c >> 24 & 0xFF;
            r = adjustedComponent(c >> 16 & 0xFF, brightness, contrast);
            g = adjustedComponent(c >> 8  & 0xFF, brightness, contrast);
            b = adjustedComponent(c       & 0xFF, brightness, contrast);
            img.pixels[i] = a << 24 | r << 16 | g << 8 | b;
        }
        img.updatePixels(); 
    }
  
    /**
    * Shifts brightness in the given image. Keeps alpha of the source pixels.
    * 
    * @param img
    *            Image to be adjusted.
    * @param brightness
    *            Value of the brightness adjustment. Integer in a range from -255 (all pixels to black) to 255 (all pixels to white). 0 causes no effect.
    */
    public void destructiveShift(PImage img, int brightness)
    {
        destructiveShift(img, brightness, 1.0);  
    }
    
    /**
    * Shifts contrast in the given image. Keeps alpha of the source pixels.
    * 
    * @param img
    *            Image to be adjusted.
    * @param contrast
    *            Value of the contrast adjustment. Its range starts in 1f (no effect). Values over 1f increase contrast and below that value decrease contrast. Negative values will invert the image.
    */
    public void destructiveShift(PImage img, float contrast)
    {
        destructiveShift(img, 0, contrast);  
    }
  
    /**
    * Shifts brightness and contrast in a defensive copy of the given image. Keeps alpha of the source pixels.
    * 
    * @param img
    *            Source image.
    * @param brightness
    *            Value of the brightness adjustment. Integer in a range from -255 (all pixels to black) to 255 (all pixels to white). 0 causes no effect.
    * @param contrast
    *            Value of the contrast adjustment. Its range starts in 1f (no effect). Values over 1f increase contrast and below that value decrease contrast. Negative values will invert the image.
    * @return An adjusted defensive copy of the given image.
    */
    public PImage nondestructiveShift(PImage img, int brightness, float contrast)
    {
        PImage out = createImage(img.width, img.height, ARGB);
        img.loadPixels();
        out.loadPixels();
        int l = img.pixels.length;
        
        //Variables to hold single pixel color and its components 
        int c = 0;
        int a = 0;
        int r = 0;
        int g = 0;
        int b = 0;
        
        for(int i = 0; i < l; i++)
        {
            c = img.pixels[i];
            a = c >> 24 & 0xFF;
            r = adjustedComponent(c >> 16 & 0xFF, brightness, contrast);
            g = adjustedComponent(c >> 8  & 0xFF, brightness, contrast);
            b = adjustedComponent(c       & 0xFF, brightness, contrast);
            out.pixels[i] = a << 24 | r << 16 | g << 8 | b;
        }
        out.updatePixels();
        return out;  
    }  
    
    /*
    * Shifts brightness in a defensive copy of the given image. Keeps alpha of the source pixels.
    * 
    * @param img
    *            Image to be adjusted.
    * @param brightness
    *            Value of the brightness adjustment. Integer in a range from -255 (all pixels to black) to 255 (all pixels to white). 0 causes no effect.
    */ 
    public void nondestructiveShift(PImage img, int brightness)
    {
        nondestructiveShift(img, brightness, 1.0);  
    }
 
    /**
    * Shifts contrast in a defensive copy of the given image. Keeps alpha of the source pixels.
    * 
    * @param img
    *            Image to be adjusted.
    * @param contrast
    *            Value of the contrast adjustment. Its range starts in 1f (no effect). Values over 1f increase contrast and below that value decrease contrast. Negative values will invert the image.
    */   
    public void nondestructiveShift(PImage img, float contrast)
    {
        nondestructiveShift(img, 0, contrast);  
    } 
        
    /**
    * Calculates the transformation of a single color component.
    * 
    * @param component
    *            Integer value of the component in a range 0-255.
    * @param brightness
    *            Value of the brightness adjustment. Integer in a range from -255 (all pixels to black) to 255 (all pixels to white). 0 causes no effect.
    * @param contrast
    *            Value of the contrast adjustment. Its range starts in 1f (no effect). Values over 1f increase contrast and below that value decrease contrast. Negative values will invert the image.
    * @return The adjusted value of the component, constrained in its natural range 0-255.
    */
    private int adjustedComponent(int component, int brightness, float contrast)
    {
        component = int((component - 128) * contrast) + 128 + brightness;
        return component < 0 ? 0 : component > 255 ? 255 : component;  
    }  
}

