require '/Users/emerylumsden/Development/cli_whats_your_foundation_type/environment.rb'
require_relative './api.rb'
class CLI  
    #interacts with user 
        #ask the user what skin type do they have (options :dry, oily, combination)
        #ask the user what kind of finish they would like (options: dewy, satin, matte)
    #returns any puts or gets statement
    #controls the flow of our program
    def start 
        puts "Welcome"
        tab 
        API.fetch_makeup
        # API.list 
        #take us to another method in your CLI
        self.menu
    end
    
    def menu
        puts "What is you favorite feature on your face?"
        sleep 1
        space 
        puts "Option 1: Eyes (That's your money maker!)"
        sleep 1
        puts "Option 2: Lips (Those lips were made for talking...)"
        sleep 1
        puts "Option 3: Skin (Just like BUTTAH!)"
        sleep 1
        puts "Option 4: I like them all!"
        puts " "
        user_input = gets.chomp.downcase 
        space 
        if user_input.include?("exit") || user_input.include?("end")
            goodbye
        elsif user_input.include?("I don't have one") || user_input.include?("none")
            encouragement
        elsif user_input.include?("eyes") || user_input == "1"
            self.eyes 
        elsif user_input.include?("lips") || user_input == "2"
            self.lips 
        elsif user_input.include?("skin") || user_input == "3"
            puts "You must share with me your skin care routine later!"
            space 
            self.skin 
        elsif user_input == "4" || user_input.include?("I like them all") || user_input.include?("all")
            self.face  
        else
           goodbye_smart
        end
    end

    def display_all_the_makeup
        #access all the makeup
        #print each one out
        MakeUp.all.each_with_index do |makeup, index|
            puts "#{index + 1}. #{makeup.name}"
        end
    end

    def eyes
        puts "You have goregous eyes!"
        sleep 1
        puts "I think EYE have the perfect product for you!"
        sleep 1
        puts "Do you want to take a look?"
        sleep 1
        puts " "
        user_input1 = gets.chomp.downcase 
        if user_input1.include?("yes") || user_input1.include?("y") 
            space 
            puts "Great! I love this product!"
            space
            sleep 1 
            eyeliner
            space 
            sleep 1
            puts "Would you like the product info?"
            space
            user_resp = gets.chomp.downcase 
                if user_resp.include?("yes")
                    space
                    sleep 1
                    eyeliner
                    space 
                    eyeliner_info
                    sleep 2
                    goodbye
                else
                    goodbye
                end
            goodbye 
        else
            goodbye
        end
    end

    def lips
        puts "It must be the shape because your lips are popping!"
        space 
        puts "Do we like a glossy fun lip or do we prefer a sophistcated lip."
        space 
        lip_choice = gets.chomp.downcase
            if lip_choice.include?("fun") || lip_choice.include?("glossy")
                puts "You have to try this!"
                space 
                lipgloss 
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        lipgloss
                        space 
                        lipgloss_info
                        sleep 2
                        goodbye
                    else
                        goodbye
                    end
            elsif lip_choice.include?("sophisticated")
                puts "I think this would be your speed!"
                space 
                lipstick 
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        lipstick
                        space 
                        lipstick_info
                        sleep 2
                        goodbye
                    else
                        goodbye
                    end
            elsif lip_choice.include?("both") || lip_choice.include?("combination")
                puts "I love this mentality! Here is the information for both!"
                space 
                lipstick 
                puts "&"
                lipgloss 
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        lipstick
                        space 
                        lipstick_info
                        space
                        space
                        lipgloss
                        space
                        lipgloss_info
                        sleep 2
                        goodbye
                    else
                        goodbye
                    end
            else
                goodbye
            end
    end

    def skin
        puts " We offer two foundations. Let's figure out which one is best for you."
        space 
        sleep 2 
        puts "I have a two question for you." 
        space  
        sleep 2
        puts "Do you have dry, combo, or oily skin?" 
        puts "Do you like a dewy or matte finish?"
        space
        puts "(choose one from each question)"
        space 
        skin_info = gets.chomp.downcase
        space 
            if skin_info.include?("dry") && skin_info.include?("matte")
                puts "You want to load up on moisturizer first, but this would be your perfect product."
                sleep 1
                space 
                foundation_stick
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        foundation_stick
                        space 
                        foundation_stick_info
                        sleep 2
                        space 
                        goodbye
                    else
                        goodbye
                    end
            elsif skin_info.include?("oily") && skin_info.include?("matte")
                puts "This one was designed for you!"
                foundation_stick
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        foundation_stick
                        space 
                        foundation_stick_info
                        sleep 2
                        space 
                        goodbye
                    else
                        goodbye
                    end
            elsif skin_info.include?("dry") && skin_info.include?("dewy")
                puts "This one was designed for you!"
                foundation
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        foundation
                        space 
                        foundation_info
                        sleep 2
                        space 
                        goodbye
                    else
                        goodbye
                    end
            elsif skin_info.include?("oily") && skin_info.include?("dewy")
                puts "Hmm, I would put on a mattifying primer first, but this product would work!"
                foundation
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        foundation
                        space 
                        foundation_info
                        sleep 2
                        space 
                        goodbye
                    else
                        goodbye
                    end
            elsif skin_info.include?("combo") && skin_info.include?("dewy")
                puts "Hmm, I would put on a mattifying primer first, but this product would work!"
                foundation
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        foundation
                        space 
                        foundation_info
                        sleep 2
                        space 
                        goodbye
                    else
                        goodbye
                    end
            elsif skin_info.include?("combo") && skin_info.include?("matte")
                puts "This one was designed for you!"
                foundation_stick
                space 
                sleep 1
                puts "Would you like the product info?"
                space
                user_resp = gets.chomp.downcase 
                    if user_resp.include?("yes")
                        space
                        sleep 1
                        foundation_stick
                        space 
                        foundation_stick_info
                        sleep 2
                        space 
                        goodbye
                    else
                        goodbye
                    end
            else
                puts "Hmm, did you make a mistake?"
                puts " "
                user_input_final = gets.chomp.downcase 
                space 
                    if user_input_final.include?("yes") || user_input_final == "y"
                        puts "That's okay! Please choose from the options given." 
                        sleep 2
                        puts "Let's go back to the questions!"
                        sleep 3
                        space 
                        skin 
                    else
                        puts "Hmm.."
                        sleep 2
                        puts "I have a free gift for you loading!"
                        sleep 7
                        puts "My free gift is waisting your time like you have waisted mine. Have a nice day!"
                    end
            end
    end

    def face
        puts "I love your confidence!"
        puts "Would you like to see all the products we have to offer?"
        puts " "
        user_input2 = gets.chomp.downcase 
        space 
        if user_input2.include?("yes") || user_input2 == "y"
            self.display_all_the_makeup
            space 
            options
        elsif user_input2.include?("maybe") || user_input2.include?("idk") || user_input2 == ("I don't know") || user_input2 == ("I dont know")
            puts "Come on!! Knowledge is beauty. Knowledge is Power. Beauty = Power!!"
            puts "Go ahead and say yes! I know you want to!"
            space
            user_input3 = gets.chomp.downcase 
            if user_input3.include?("yes") || user_input3 == "y"
                space 
                self.display_all_the_makeup 
                sleep 1 
                options 
            else  
                goodbye
            end
        else
            goodbye 
        end
    end

    def choice_of_product
        space 
        puts "Which one were you interested in looking at?"
        space
        product_choice = gets.chomp.downcase
        if product_choice.include?("lipstick") || product_choice == "1"
            space 
            lipstick 
            space 
            sleep 1
            puts "Would you like the product info?"
            space
            user_resp = gets.chomp.downcase 
                if user_resp.include?("yes")
                    space
                    sleep 1
                    lipstick
                    space 
                    lipstick_info
                    sleep 2
                    goodbye
                else
                    goodbye
                end
        elsif product_choice.include?("eyeliner") || product_choice == "2"
            space 
            eyeliner 
            space 
            sleep 1
            puts "Would you like the product info?"
            space
            user_resp = gets.chomp.downcase 
                if user_resp.include?("yes")
                    space
                    sleep 1
                    eyeliner
                    space 
                    eyeliner_info
                    sleep 2
                    goodbye
                else
                    goodbye
                end
        elsif product_choice.include?("lip gloss") || product_choice.include?("lip glitter") || product_choice == "3"
            space 
            lipgloss 
            space 
            sleep 1
            puts "Would you like the product info?"
            space
            user_resp = gets.chomp.downcase 
                if user_resp.include?("yes")
                    space
                    sleep 1
                    lipgloss
                    space 
                    lipgloss_info
                    sleep 2
                    goodbye
                else
                    goodbye
                end
        elsif product_choice.include?("match stix") || product_choice.include?("matte skinstick") || product_choice == "4"
            space 
            foundation_stick 
            space 
            sleep 1
            puts "Would you like the product info?"
            space
            user_resp = gets.chomp.downcase 
                if user_resp.include?("yes")
                    space
                    sleep 1
                    foundation_stick
                    space 
                    foundation_stick_info
                    sleep 2
                    goodbye
                else
                    goodbye
                end
        elsif product_choice.include?("pro") || product_choice.include?("soft") || product_choice == "foundation" || product_choice == "5"
            space 
            foundation 
            space 
            sleep 1
            puts "Would you like the product info?"
            space
            user_resp = gets.chomp.downcase 
                if user_resp.include?("yes")
                    space
                    sleep 1
                    foundation
                    space 
                    foundation_info
                    sleep 2
                    goodbye
                else
                    goodbye
                end
        else
            goodbye
        end 
    end

    def lipstick
        MakeUp.select_product("lipstick")
    end

    def lipstick_info
        MakeUp.select_product_info("lipstick")
    end

    def lipgloss
        MakeUp.select_product_uniq("lip_gloss")
    end

    def lipgloss_info
        MakeUp.select_product_uniq_info("lip_gloss")
    end

    def eyeliner
        MakeUp.select_product("eyeliner")
    end

    def eyeliner_info
        MakeUp.select_product_info("eyeliner")
    end

    def foundation
        MakeUp.select_found(780) #utilizing the product id in order to pull the correct info
    end

    def foundation_info
        MakeUp.select_found_info(780) #utilizing the product id in order to pull the correct info
    end

    def foundation_stick
        MakeUp.select_product_uniq("concealer")
    end

    def foundation_stick_info
        MakeUp.select_product_uniq_info("concealer")
    end

    def encouragement
        puts "Makeup up is not meant to recreate, but to enhance." 
            sleep 1
            puts "Take a second, look in the mirror or take a selfie, tell yourself you are beautiful."
            sleep 1
            puts "Repeat those steps until you see how beautiful we think you are!"
            sleep 1
            puts "See you soon!"
    end

    def tab
        puts " "
        sleep 1
        puts " "
    end

    def space 
        puts "  "
    end

    def options
        puts "Quite a few choices." 
        sleep 1
        puts "Did you you want to look at one specifically?"
        sleep 1
        space 
        choice = gets.chomp.downcase 
        if choice.include?("yes") || choice == "yes"
            choice_of_product
        else 
            goodbye
        end
    end
    
    def goodbye
        space
        sleep 1
        puts "Would you like to go back to the main menu?"
        space
        user_resp = gets.chomp.downcase
        space
        if user_resp.include?("yes") || user_resp == "y" || user_resp.include?("I don't know") || user_resp.include?("idk") || user_resp.include?("not sure")
            puts "That's okay! Let's go back to the menu!"
            tab
            menu
        else
            puts "That's alright! You're still goregous. Maybe next time! Goodbye!"
        end
    end

    def goodbye_smart
        puts "Hmm, did you make a mistake?"
        puts " "
        user_input_final = gets.chomp.downcase 
        space
        if user_input_final.include?("yes") || user_input_final == "y"
            puts "That's okay! Please choose from the options given." 
            sleep 2
            puts "Let me redirect you back to the main menu."
            sleep 3
            tab 
            menu
        else
            puts "Hmm.."
            sleep 2
            puts "I have a free gift for you loading!"
            sleep 7
            puts "My free gift is waisting your time like you have waisted mine. Have a nice day!"
        end
    end
end

