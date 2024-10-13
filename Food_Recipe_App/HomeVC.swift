//
//  HomeVC.swift
//  Food_Recipe_App
//
//  Created by Admin on 03/12/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tblFoodList: UITableView!
    
    var foodData = [ListOfFoodModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        tblFoodList.delegate = self
        tblFoodList.dataSource = self
        
        tblFoodList.register(UINib(nibName: "FoodListCell", bundle: nil), forCellReuseIdentifier: "FoodListCell")
        let nib = UINib(nibName: "FoodListHeaderVIew", bundle: nil)
        tblFoodList.register(nib, forHeaderFooterViewReuseIdentifier: "FoodListHeaderVIew")
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodData[section].arrDataList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = self.tblFoodList.dequeueReusableHeaderFooterView(withIdentifier: "FoodListHeaderVIew")  as! FoodListHeaderVIew
        view.lblFoodHeader.text = foodData[section].foodTitle
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFoodList.dequeueReusableCell(withIdentifier: "FoodListCell") as! FoodListCell
        cell.lblFoodName.text = foodData[indexPath.section].arrDataList[indexPath.row].foodName
        cell.imgFood.image = UIImage(named: foodData[indexPath.section].arrDataList[indexPath.row].foodName)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
        
    }
   

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("print",foodData[indexPath.section].arrDataList[indexPath.row].foodName)
        print("print",foodData[indexPath.section].arrDataList[indexPath.row].foodDiscreption)
        if tableView == tblFoodList {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
            vc.foodName = foodData[indexPath.section].arrDataList[indexPath.row].foodName
            vc.foodDiscription = foodData[indexPath.section].arrDataList[indexPath.row].foodDiscreption
            vc.titleName = foodData[indexPath.section].foodTitle
            vc.imgName = foodData[indexPath.section].arrDataList[indexPath.row].foodName
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension HomeVC {
    func setup() {
        
        let item2 = [ListOfFoodModel(foodTitle: "Panjabi",arrDataList:
                                        [FoodNameModel(foodName: "Shakkar Para - A sweet, indulgent dish of Punjab!", foodDiscreption: "A great accompaniment to tea, it can also be snacked on when you're craving something a little sweet. Made from semolina and flour, it is light and not overly sweet. For those with a sweeter tooth, these can be coated in coarse sugar or desecrated coconut for a different flavour. These can be just as easily made at home and stored for 2-3 weeks to keep munching on! It is deep-fried Punjabi Food so do be careful of how many you munch on."),
                                         FoodNameModel(foodName: "Lassi", foodDiscreption: "A drink known far and wide, lassi is something Punjabi's pride themselves in. Though it can be salty, the original lassi as it became famous, is sweet with a dollop of cream and butter to make it as rich as you can. Flavours like mango rose or strawberry are added these days to give it a twist while beating the summer heat. Almost all restaurants serve this even if they're not Punjabi joints which show the popularity of this humble drink."),
                                         FoodNameModel(foodName: "Chole", foodDiscreption: "Be it Amritsari chole or Peshwari chole, they're both equally delicious, just the place of origin varies. A staple in Punjabi cuisine, this chickpea dish is best had with either a paratha or naan. Or you can just have spoonfuls of it as is, given how good it tastes. The difference between them is that Peshwari is slightly drier while Amritsar is made with a bit of gravy. The spices used are also different but not all that much. So it really depends on which part of the food of Punjab you feel like owning your allegiance to while ordering!"),
                                         FoodNameModel(foodName: "Chole-Bhature - Punjabi Food Fiesta!", foodDiscreption: "It's a standard Punjabi dish in most fast-food restaurants now. And these two accompany each other like a dream when you feel like indulging a little. Made with flour and milk rather than wheat flour, it's different from a poori. And although it's much larger than a poori, you can't just eat one because it's that tasty! The soft, slightly fermented bhatura should be your Go-to when you are craving some hardcore, spicy food of Punjab."),
                                         FoodNameModel(foodName: "Parantha - The Staple Food of Punjab", foodDiscreption: "No matter who you are, chances are that you've had a parantha at least once in your life. This delectable offering has come to India through the annals of Punjabi cuisine, and what a discovery that was! Be it plain or stuffed, this bread is a staple of most Punjabi households. Even while travelling, the most preferred item to eat at a Dhaba is mostly always a paratha. Fried in desi ghee is the way most people in Punjab like it. Have with some cold curd and pickle, it is quite a humble match made in gastronomic heaven.The possibilities of the stuffings are endless. Be it potatoes, onions, cottage cheese, keema to newer variants like bottle gourd, mangoes and almost anything you could imagine! The popularity is a testament is a fact that the national capital also has an area 'parathewali gali' dedicated to serving up all possible varieties of it. Plus, like a roti, it doesn't even have to be round so you can definitely make it at home without being taunted about making a 'world map' in the name of food!"),
                                         FoodNameModel(foodName: "Dal Makhani", foodDiscreption: "If one dal had to rule them all, it would definitely be the dal makhani. This delectable buttery Punjabi dish of lentils is a rich concoction of black lentils and red kidney beans made in a thick gravy made even richer with dollops of cream. It's a dish worth serving in a royal court. Traditionally, it simmers for 2-3 hours over a low flame to get it to thicken as the flavours keep becoming deeper."),
                                         FoodNameModel(foodName: "Paneer Tikka", foodDiscreption: "Also called 'chicken of the vegetarians', the paneer tikka has a special place in the food of Punjab. Chargrilled and spiced, this soft cottage cheese delicacy is the first to come to mind when one thinks of vegetarian appetisers. And frankly, any menu would be incomplete without it!")
                                        ])]
        foodData.append(contentsOf: item2)
        let item3 = [ListOfFoodModel(foodTitle: "Gujrati", arrDataList:
                                        [FoodNameModel(foodName: "Khaman", foodDiscreption: "A tasty and healthy steamed snack made from freshly ground lentils and chickpea flour, it is very similar to its humble cousin, the world-famous -dhokla. To prepare the khaman, the khaman flour mix is boiled along with turmeric, salt and baking soda to make it light and fluffy. It is then cut up into cubes and usually garnished with mustard seeds, coriander leaves, sev and chopped onions. Traditionally served on a large green leaf called the Kesuda, the modern, urban version is served in newspapers in farsan (snack) shops with tangy chutneys and several pieces of green chillies. Popular adaptations of the khaman include Ameri khaman (mashed up khaman garnished with sev and pomegranate), Nylon khaman (softer and fast-cooking khaman) and Masala khaman (khaman served with hot and spicy chilly powder)"),
                                         FoodNameModel(foodName: "Thepla - A Snack that every Gujarati Swear by!", foodDiscreption: "No Gujarati journeys, picnics, foreign trips or even business trips are complete without this ubiquitous snack. Made from gram flour, whole wheat flour, fresh fenugreek leaves and spices, these flatbreads are healthy snacking options with a long shelf life. Usually served piping hot with fresh curd, pickles or chundo, they make wholesome meals. When accompanied by a cup of steaming hot tea, they also make a sumptuous breakfast or a great snack during the monsoon. Although the methi (fenugreek) ones are the most common, other varieties include palak (spinach), amaranth or muli (raddish) theplas-specially recommended for fussy eaters."),
                                         FoodNameModel(foodName: "Khandvi - The Delectable Gujarati Naashta", foodDiscreption: "Thin layers of gram flour cooked with buttermilk and rolled up in mushy goodness, seasoned with sautéed sesame seeds and a few other spices, that's khandvi for you. The simple but aromatic garnishing of curry leaves, coriander, sautéed cumin, mustard and coconut makes it simply irresistible.  Also called 'suralichya wadya' in Maharashtra, it is a popular snack among Gujaratis and Maharashtrians alike. Although loved by all, no one can deny that this dish is a little tricky to cook, especially getting the consistency of the batter right. Light on the stomach and pleasing on the tongue, khandvi can be a perfect breakfast item or a delectable evening snack"),
                                         FoodNameModel(foodName: "Undhiyu - The Winter Delicacy", foodDiscreption: "The king of Gujarati dishes Undhiyu (and of course Uttarayan) is the reason why a Gujarati eagerly awaits winter. It derives its name from the Gujarati word undhu, meaning inverted, it is a classical Gujarati dish made in an inverted clay pot. It is a special winter delicacy made from the choicest of fresh produce readily available in winter. Common ingredients include eggplant, crunchy muthiyas (fried chickpea flour dumplings), potatoes, yam, green peas, bananas and beans, slow-cooked to perfection with buttermilk, coconut and spices. Undhiyu served with puris and shrikhand is a common occurrence during Gujarati weddings."),
                                         FoodNameModel(foodName: "Muthiya - The snack you couldn't say no to!", foodDiscreption: "Named after the action that is used to shape the dough, these fist-cakes make for a great breakfast or evening snack. To prepare these, a mixture of chickpea flour, bottle gourd and spices is prepared, steamed, pan-fried and seasoned. If you skip the pan-frying, it becomes a great meal for the health-conscious folks. Other varieties include usage of spinach, fenugreek, amaranth or even bitter gourd. Juicy and fluffy on the inside, golden and crispy on the outside, no one can ever say no to a bowlful of muta hiya. Best relished with a dash of mint-coriander chutney or ketchup, and a cup of steaming hot tea. Try this Gujarati dish to know what it is all about."),
                                         FoodNameModel(foodName: "Handvo - The Savoury Cake", foodDiscreption: "Traditionally prepared over charcoal or in a pressure cooker, handvo is essentially a savoury cake. To prepare handvo, a batter of lentils and rice is prepared and fermented overnight, and then baked. They are sometimes also pan-fried to make them crispy and golden, and the sesame seed seasoning makes them just irresistible! These nutritious pan-fried or baked lentil cakes are a very popular one-dish meal in Gujarati households. Like most other Gujarati snacks, they are best enjoyed with tangy green chutney and a hot cuppa."),
                                         FoodNameModel(foodName: "Fafda-Jalebi - The Dream Cheat Day Breakfast!", foodDiscreption: "Made hugely popular by the daily soap 'Taarak Mehta ka Ulta Chashma', this is (almost) every Gujarati's dream cheat-day breakfast. Fafda is a crunchy, fried chickpea flour snack, jalebi is a sweet deep-fried pretzel made of wheat flour and dipped in sugar. Together, they are a match made in heaven. When you take a piece of the crunchy, salty, spicy fafda and eat it with a piece of the crunchy, sweet jalebi, you are sure to be in food heaven. Have a fried chilly or a whip of the dry papaya chutney with this combination, and your taste buds will burst away to glory. Almost every street corner in Gujarat, esp. Ahmedabad has a shop selling these. On Sundays, there are huge queues outside farsan shops, for an indulgent breakfast of this heavenly duo."),
                                         FoodNameModel(foodName: "Lilva Kachori - The perfect rainy-day snack!", foodDiscreption: "A great winter and monsoon tea-time snack, kachoris are balls made of flour and stuffed with any filling of your choice. They are a popular delicacy in the western and northern part of India. Lilva Kachori is a special Gujarati dish, made with a filling of pigeon peas. To prepare these the kachori dough is prepared from white flour and semolina, rolled out and filled with the lilva mixture (pigeon peas, green chilies, coriander and spices), rolled into balls and then fried off. Best served with tangy chutney or sauce, this is a crunchy, tasty snack that can make the cold evenings warmer and more enjoyable."),
                                         FoodNameModel(foodName: "Sev Tameta nu Shak", foodDiscreption: "A sweet, salty, tangy, spicy shak (vegetable preparation) made from tomatoes and sev is a favourite Gujarati dish, especially among children. To prepare this dish, diced tomatoes and onions are sautéed with oil and spices and then cooked in steam. Crispy sev is added as a garnish at the time of serving along with freshly cut coriander. Easy to make and delicious to eat. It ticks all the boxes-colour, texture, crunch, flavour etc. Relish it with parathas, theplas or the humble phulkas for a hearty meal."),
                                         FoodNameModel(foodName: "Gujarati Kadhi", foodDiscreption: "No Gujarati thali meal is ever complete without the kadhi. Distinctively recognized because of its white color, this is a traditional dish made of sour curd, spiced with thickened gram flour and sweetened with a jaggery or sugar. The texture of this sweet and spicy, thin soup-like kadhi can be enhanced with the addition of koftas or pakoras. It makes for an excellent summer dish because of its cooling nature, and is best relished with soft phulkas or steaming hot basmati rice.  Hearty to eat and simple to cook, it is a staple food of Gujarat."),
                                         FoodNameModel(foodName: "Khichu - The soft and gooey snack", foodDiscreption: "What started off as a dough for making the yummy khichiya papads, itself ended up as a delicious dish. Commonly found across the food stalls in many Dandiya and garba venues during Navratri, it is a dough made from rice flour added to boiling water alongside green chillies, cumin seeds, and sesame seeds, then cooked in steam and seasoned with groundnut oil. The groundnut oil seasoning gives a gourmet touch to this simple, wholesome dish. Although it is commonly prepared using the rice flour, other variants include usage of wheat flour, nachani (ragi) flour, bajri flour and jowar flour. Its warm, soft and gooey texture makes it a great evening snack during the colder months, loved by children and adults alike."),
                                         FoodNameModel(foodName: "Gota - The Gujarati Pakoras!", foodDiscreption: "Each state in India has its own version of the golden, crispy, yummy pakodas (fritters), and Gujarat is no exception. Gota is Gujarat's very own pakoda dish made from gram flour and fenugreek leaves. Originating from the village of Dakor in Gujarat, Gota is a traditional Gujarati dish and a special delicacy during Holi. Easy and fast to prepare and having a soft texture, it also makes for a delicious evening snack, especially when it is raining outside. Best relished with ketchup or a sweet and tangy chutney made from dates and tamarind."),
                                         FoodNameModel(foodName: "Mohanthal - Janmashtami Delicacy", foodDiscreption: "A signature dish of many Gujarati households with each housewife adding her own special touch to this traditional recipe, Mohanthal is a soft fudge-like sweet made from sweetened gram flour (besan) and flavoured with saffron, cardamom and nuts like almonds and pistachios. A simple and homely treat for the palate, it is said to be Lord Krishna's favorite dessert, and hence made very lovingly during the festival of Janmashtami. Although a traditional dessert, it is sometimes also prepared to satisfy those untimely dessert cravings. It can also be served as a tea-time snack, and can be found in all mithai shops across the state.")
                                         
                                        ])]
        foodData.append(contentsOf: item3)
        
        let item4 = [ListOfFoodModel(foodTitle: "South Indian", arrDataList:
                                        [FoodNameModel(foodName: "Dosas", foodDiscreption: "Dosas are not only the traditional breakfast of South India but also the most popular comfort food all across the country. They are prepared when a batter of fermented rice and lentils is smeared on a pan. Masala Dosas have a filling of aloo sabzi inside them. These days you can try different variants of dosas like rawa dosa, tomato dosa, cheese dosa and more."),
                                         FoodNameModel(foodName: "Idli Sambar", foodDiscreption: "Soft and fluffy white idlis are another breakfast option in South India. Idlis are also prepared with a batter of fermented rice and lentils. This batter is put in circular moulds and steamed on a stove. Idlis are served with hot and tangy sambar, coconut chutney and gun powder chutney. The fluffy delicacy is soft and easy on the digestion."),
                                         FoodNameModel(foodName: "Medu Vada", foodDiscreption: "Medu Vada is a circular brown, doughnut like dish that is served with chutneys. The dough is made, shaped and deep fried in oil to give it a perfect colour and a crispy and crunchy taste. The dough is made with a batter of black lentils, peppercorns, curry leaves, red chillies, cumin and other spices."),
                                         FoodNameModel(foodName: "Uttapam", foodDiscreption: "Uttapam can also be described as salty and spicy pancake. It is made with a spicy and tangy batter of fermented rice and lentils that is mixed and topped with shredded onions, tomatoes and green chilies. Nowadays, you can find several variants of uttapams like tomato uttapam, cheese uttapam and more."),
                                         FoodNameModel(foodName: "Fish Molee", foodDiscreption: "Fish Molee, also known as Fish Moolie is a speciality of Kerala and it tastes heavenly. Made in coconut milk and traditional spices, fish molee is best served with appams. Reminding of traditional Portuguese flavours, this fish stew has mild spices and is one of the most prominent dishes of the state."),
                                         FoodNameModel(foodName: "Kerala Prawn Curry", foodDiscreption: "Kerala Prawn Curry is the signature dish of Kerala that is infused with mildly spicy, hot and tangy flavours. The scrumptious dish can be devoured with a Malabari Parotha, bread, rice or appam. The curry is prepared in coconut milk and is sometimes topped with raw mango shreds and peppercorns."),
                                         FoodNameModel(foodName: "Bisi Bele Bhaat", foodDiscreption: "Bisi Bele Bhaat is a traditional Karnataka dish. It is made when steamed rice is cooked together with toor daal, vegetables and spices. It is a regional counterpart of north Indian “khichdi”. The dish is best served with boondi raita, chutney, salad, papad or potato/ banana chips. It is a part of the Udipi cuisine."),
                                         FoodNameModel(foodName: "Payasam", foodDiscreption: "Payasam is a hot favourite of the South Indian when it comes to desserts. It is an authentic rice based “kheer” that is made with rice cooked along with milk, ghee and sugar. The sweet dish is topped with dried fruits, shredded coconut and saffron."),
                                         FoodNameModel(foodName: "Hyderabadi Biryani", foodDiscreption: "Hyderabadi Biryani is one popular South Indian dish known for its varied flavours and its incredible taste. The dish is a blend of the Mughlai and Iranian flavours. It is made when rice is cooked along with meat and an array of spices. It is cooked in a handi with marinated meat and soaked rice."),
                                         FoodNameModel(foodName: "Curd Rice", foodDiscreption: "Curd Rice is a comparatively milder dish when it comes to flavours and spices. The simple dish is just a combination of steamed rice and flavoured yoghurt or curd. Tasting tangy salty, the dish is a staple of Andhra Pradesh. Sometimes to make the dish more flavourful, they also add cumin seeds, curry leaves, peanuts, green chilies and ginger etc")
                                        ])]
        foodData.append(contentsOf: item4)
    }
}
