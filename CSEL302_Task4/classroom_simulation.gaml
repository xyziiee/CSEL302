model classroom_simulation

global {

   int number_of_students <- 20;

   init {
      create student number: number_of_students {
         location <- {rnd(100), rnd(100)};
      }
   }

}

species student {

    int energy <- 5;
    int score <- 0;
    string status <- "active";

    reflex participate when: status = "active" {

        if flip(0.4) {
            score <- score + 1;
            energy <- energy - 1;
        }

    }

    reflex update_status {

        if energy <= 0 {
            status <- "inactive";
        }

    }

    aspect default {

	   if status = "active" {
	      draw circle(2) color: rgb(0, energy * 50, 0);
	   }
	   else {
	      draw circle(2) color: #red;
	   }
	
	}

}

experiment classroom_experiment type: gui {

    output {

        display classroom_display {

            species student;

        }

    }

}