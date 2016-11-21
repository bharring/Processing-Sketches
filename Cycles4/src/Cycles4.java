
import processing.core.*;

public class Cycles4 extends PApplet {

    public static void main(String args[]) {
        PApplet.main("Cycles4");
    }

    // declare two Cycle objects
    Cycle[] cycles;

    @Override
    public void settings() {
        // TODO: Customize screen size and so on here
        size(500,500);
        pixelDensity(1);
    }

    @Override
    public void setup() {
        // set all the variables
        cycles = new Cycle[100];
        reset();
    }

    @Override
    public void draw() {
        background(50,50,60);

        // draw the dots
        noStroke();
        fill(255,255,255);
        for (int i = 0; i < cycles.length; i++) {
            cycles[i].display();
        }

        for (int i = 0; i < cycles.length; i++) {
            for (int j = 0; j < cycles.length; j++) {
                cycles[i].connectIfDotsAreClose(cycles[j]);
            }
        }

    }
    // click the mouse to redraw another set of points
    @Override
    public void mousePressed() {
        reset();
    }
    void reset() {
        for (int i = 0; i < cycles.length; i++) {
            cycles[i] = new Cycle();
        }
    }

    class Cycle {
        float pos_x;
        float pos_y;
        float radius;
        float initial;
        float theta;
        float theta_change;
        int padding = 30;
        int threshold = 70;

        // the constructor
        Cycle() {
            this.pos_x = random(padding, width - padding);
            this.pos_y = random(padding, height - padding);
            this.radius = random(1, TWO_PI);
            this.initial = random(10, 20);
            this.theta_change = random(0, TWO_PI);
            this.theta_change = random(-1, 1) / 10;
        }

        void display() {
            this.pos_x = this.radius * cos(theta + this.initial) + this.pos_x;
            this.pos_y = this.radius * sin(theta + this.initial) + this.pos_y;
            ellipse(this.pos_x, this.pos_y, 2, 2);
            // change over time
            theta = (float) (theta + theta_change);
        }

        // check if dots are close together
        void connectIfDotsAreClose(Cycle c) {
            if (dist(c.pos_x, c.pos_y, this.pos_x, this.pos_y) < threshold) {
                stroke(0,255,0);
                line(c.pos_x, c.pos_y, this.pos_x, this.pos_y);
            }
        }
    }
}
