//
//  VerseData.swift
//  Promises
//

import Foundation

/// The bundled, offline collection of promises, grouped by topic.
///
/// Each verse carries its text in every supported Bible version — the World
/// English Bible (WEB) and the Malayalam Sathyavedapusthakam / Old Version,
/// both public domain — sharing one stable reference so favorites, the daily
/// verse, and the shuffle stay consistent when the user switches versions.
enum VerseData {

    /// Topics in alphabetical order; the order of `topic_N` tile images matches.
    static let topics: [Topic] = [
        Topic(
            name: "Addiction & Freedom",
            verses: [
                Verse(
                    reference: "1 Corinthians 10:13",
                    web: "No temptation has taken you except what is common to man. God is faithful, who will not allow you to be tempted above what you are able, but will with the temptation also make the way of escape, that you may be able to endure it.",
                    malayalam: "മനുഷ്യര്‍ക്കു നടപ്പല്ലാത്ത പരീക്ഷ നിങ്ങള്‍ക്കു നേരിട്ടിട്ടില്ല; ദൈവം വിശ്വസ്തന്‍; നിങ്ങള്‍ക്കു കഴിയുന്നതിനു മീതെ പരീക്ഷ നേരിടുവാന്‍ സമ്മതിക്കാതെ നിങ്ങള്‍ക്കു സഹിപ്പാന്‍ കഴിയേണ്ടതിനു പരീക്ഷയോടുകൂടെ അവന്‍ പോക്കുവഴിയും ഉണ്ടാക്കും."
                ),
                Verse(
                    reference: "John 8:36",
                    web: "If therefore the Son makes you free, you will be free indeed.",
                    malayalam: "പുത്രന്‍ നിങ്ങള്‍ക്കു സ്വാതന്ത്ര്യം വരുത്തിയാല്‍ നിങ്ങള്‍ സാക്ഷാല്‍ സ്വതന്ത്രര്‍ ആകും."
                ),
                Verse(
                    reference: "Galatians 5:1",
                    web: "Stand firm therefore in the liberty by which Christ has made us free, and don’t be entangled again with a yoke of bondage.",
                    malayalam: "സ്വാതന്ത്ര്യത്തിനായിട്ടു ക്രിസ്തു നമ്മെ സ്വതന്ത്രരാക്കി; ആകയാല്‍ അതില്‍ ഉറച്ചുനില്പിന്‍; അടിമനുകത്തില്‍ പിന്നെയും കുടുങ്ങിപ്പോകരുത്."
                ),
                Verse(
                    reference: "Romans 6:14",
                    web: "For sin will not have dominion over you, for you are not under law, but under grace.",
                    malayalam: "നിങ്ങള്‍ ന്യായപ്രമാണത്തിനല്ല, കൃപയ്ക്കത്രേ അധീനരാകയാല്‍ പാപം നിങ്ങളില്‍ കര്‍ത്തൃത്വം നടത്തുകയില്ലല്ലോ."
                ),
                Verse(
                    reference: "2 Corinthians 5:17",
                    web: "Therefore if anyone is in Christ, he is a new creation. The old things have passed away. Behold, all things have become new.",
                    malayalam: "ഒരുത്തന്‍ ക്രിസ്തുവിലായാല്‍ അവന്‍ പുതിയ സൃഷ്ടി ആകുന്നു; പഴയത് കഴിഞ്ഞുപോയി, ഇതാ, അതു പുതുതായി തീര്‍ന്നിരിക്കുന്നു."
                ),
            ]
        ),
        Topic(
            name: "Anxiety & Worry",
            verses: [
                Verse(
                    reference: "Philippians 4:6-7",
                    web: "In nothing be anxious, but in everything, by prayer and petition with thanksgiving, let your requests be made known to God. And the peace of God, which surpasses all understanding, will guard your hearts and your thoughts in Christ Jesus.",
                    malayalam: "ഒന്നിനെക്കുറിച്ചും വിചാരപ്പെടരുത്; എല്ലാറ്റിലും പ്രാര്‍ഥനയാലും അപേക്ഷയാലും നിങ്ങളുടെ ആവശ്യങ്ങള്‍ സ്തോത്രത്തോടുകൂടെ ദൈവത്തോട് അറിയിക്കയത്രേ വേണ്ടത്. എന്നാല്‍ സകല ബുദ്ധിയെയും കവിയുന്ന ദൈവസമാധാനം നിങ്ങളുടെ ഹൃദയങ്ങളെയും നിനവുകളെയും ക്രിസ്തുയേശുവിങ്കല്‍ കാക്കും."
                ),
                Verse(
                    reference: "1 Peter 5:7",
                    web: "casting all your worries on him, because he cares for you.",
                    malayalam: "അവന്‍ നിങ്ങള്‍ക്കായി കരുതുന്നതാകയാല്‍ നിങ്ങളുടെ സകല ചിന്താകുലവും അവന്‍റെമേല്‍ ഇട്ടുകൊള്‍വിന്‍."
                ),
                Verse(
                    reference: "Matthew 6:34",
                    web: "Therefore don’t be anxious for tomorrow, for tomorrow will be anxious for itself. Each day’s own evil is sufficient.",
                    malayalam: "അതുകൊണ്ടു നാളേക്കായി വിചാരപ്പെടരുത്; നാളത്തെ ദിവസം തനിക്കായി വിചാരപ്പെടുമല്ലോ; അതതു ദിവസത്തിന് അന്നന്നത്തെ ദോഷം മതി."
                ),
                Verse(
                    reference: "Psalm 94:19",
                    web: "In the multitude of my thoughts within me, your comforts delight my soul.",
                    malayalam: "എന്‍റെ ഉള്ളിലെ വിചാരങ്ങളുടെ ബഹുത്വത്തിൽ നിന്‍റെ ആശ്വാസങ്ങള്‍ എന്‍റെ പ്രാണനെ തണുപ്പിക്കുന്നു."
                ),
                Verse(
                    reference: "Isaiah 26:3",
                    web: "You will keep whoever’s mind is steadfast in perfect peace, because he trusts in you.",
                    malayalam: "സ്ഥിരമാനസന്‍ നിന്നിൽ ആശ്രയം വച്ചിരിക്കകൊണ്ടു നീ അവനെ പൂര്‍ണസമാധാനത്തിൽ കാക്കുന്നു."
                ),
            ]
        ),
        Topic(
            name: "Children",
            verses: [
                Verse(
                    reference: "Ephesians 6:1",
                    web: "Children, obey your parents in the Lord, for this is right.",
                    malayalam: "മക്കളേ, നിങ്ങളുടെ അമ്മയപ്പന്മാരെ കര്‍ത്താവില്‍ അനുസരിപ്പിന്‍; അതു ന്യായമല്ലോ."
                ),
                Verse(
                    reference: "Matthew 19:14",
                    web: "Jesus said, “Allow the little children, and don’t forbid them to come to me; for the Kingdom of Heaven belongs to ones like these.”",
                    malayalam: "യേശുവോ: ശിശുക്കളെ എന്‍റെ അടുക്കല്‍ വരുവാന്‍ വിടുവിന്‍; അവരെ തടുക്കരുത്; സ്വര്‍ഗരാജ്യം ഇങ്ങനെയുള്ളവരുടേതല്ലോ എന്നു പറഞ്ഞു."
                ),
                Verse(
                    reference: "Proverbs 22:6",
                    web: "Train up a child in the way he should go, and when he is old he will not depart from it.",
                    malayalam: "ബാലന്‍ നടക്കേണ്ടുന്ന വഴിയിൽ അവനെ അഭ്യസിപ്പിക്ക; അവന്‍ വൃദ്ധനായാലും അതു വിട്ടുമാറുകയില്ല."
                ),
                Verse(
                    reference: "Ephesians 4:32",
                    web: "Be kind to one another, tender hearted, forgiving each other, just as God also in Christ forgave you.",
                    malayalam: "നിങ്ങള്‍ തമ്മില്‍ ദയയും മനസ്സലിവുമുള്ളവരായി ദൈവം ക്രിസ്തുവില്‍ നിങ്ങളോടു ക്ഷമിച്ചതുപോലെ അന്യോന്യം ക്ഷമിപ്പിന്‍."
                ),
                Verse(
                    reference: "Psalm 4:8",
                    web: "In peace I will both lay myself down and sleep, for you, LORD alone, make me live in safety.",
                    malayalam: "ഞാന്‍ സമാധാനത്തോടെ കിടന്നുറങ്ങും; നീയല്ലോ യഹോവേ, എന്നെ നിര്‍ഭയം വസിക്കുമാറാക്കുന്നത്."
                ),
                Verse(
                    reference: "Psalm 107:1",
                    web: "Give thanks to the LORD, for he is good, for his loving kindness endures forever.",
                    malayalam: "യഹോവയ്ക്കു സ്തോത്രം ചെയ്‍വിന്‍; അവന്‍ നല്ലവനല്ലോ അവന്‍റെ ദയ എന്നേക്കുമുള്ളത്!"
                ),
                Verse(
                    reference: "Psalm 56:3",
                    web: "When I am afraid, I will put my trust in you.",
                    malayalam: "ഞാന്‍ ഭയപ്പെടുന്ന നാളിൽ നിന്നിൽ ആശ്രയിക്കും."
                ),
            ]
        ),
        Topic(
            name: "Comfort & Grief",
            verses: [
                Verse(
                    reference: "Psalm 23:4",
                    web: "Even though I walk through the valley of the shadow of death, I will fear no evil, for you are with me. Your rod and your staff, they comfort me.",
                    malayalam: "കൂരിരുള്‍താഴ്വരയിൽകൂടി നടന്നാലും ഞാന്‍ ഒരു അനര്‍ഥവും ഭയപ്പെടുകയില്ല; നീ എന്നോടുകൂടെ ഇരിക്കുന്നുവല്ലോ; നിന്‍റെ വടിയും കോലും എന്നെ ആശ്വസിപ്പിക്കുന്നു."
                ),
                Verse(
                    reference: "Matthew 5:4",
                    web: "Blessed are those who mourn, for they shall be comforted.",
                    malayalam: "ദുഃഖിക്കുന്നവര്‍ ഭാഗ്യവാന്മാര്‍; അവര്‍ക്ക് ആശ്വാസം ലഭിക്കും."
                ),
                Verse(
                    reference: "2 Corinthians 1:3-4",
                    web: "Blessed be the God and Father of our Lord Jesus Christ, the Father of mercies and God of all comfort, who comforts us in all our affliction.",
                    malayalam: "മനസ്സലിവുള്ള പിതാവും സര്‍വാശ്വാസവും നല്കുന്ന ദൈവവുമായി നമ്മുടെ കര്‍ത്താവായ യേശുക്രിസ്തുവിന്‍റെ പിതാവായ ദൈവം വാഴ്ത്തപ്പെട്ടവന്‍. ദൈവം ഞങ്ങളെ ആശ്വസിപ്പിക്കുന്ന ആശ്വാസംകൊണ്ടു ഞങ്ങള്‍ യാതൊരു കഷ്ടത്തിലുമുള്ളവരെ ആശ്വസിപ്പിപ്പാന്‍ ശക്തരാകേണ്ടതിനു ഞങ്ങള്‍ക്കുള്ള കഷ്ടത്തിലൊക്കെയും അവന്‍ ഞങ്ങളെ ആശ്വസിപ്പിക്കുന്നു."
                ),
                Verse(
                    reference: "Revelation 21:4",
                    web: "He will wipe away every tear from their eyes. Death will be no more; neither will there be mourning, nor crying, nor pain any more. The first things have passed away.",
                    malayalam: "അവന്‍ അവരുടെ കണ്ണില്‍നിന്നു കണ്ണുനീര്‍ എല്ലാം തുടച്ചുകളയും. ഇനി മരണം ഉണ്ടാകയില്ല; ദുഃഖവും മുറവിളിയും കഷ്ടതയും ഇനി ഉണ്ടാകയില്ല; ഒന്നാമത്തേത് കഴിഞ്ഞുപോയി."
                ),
                Verse(
                    reference: "Matthew 11:28",
                    web: "Come to me, all you who labor and are heavily burdened, and I will give you rest.",
                    malayalam: "അധ്വാനിക്കുന്നവരും ഭാരം ചുമക്കുന്നവരും ആയുള്ളോരേ, എല്ലാവരും എന്‍റെ അടുക്കല്‍ വരുവിന്‍; ഞാന്‍ നിങ്ങളെ ആശ്വസിപ്പിക്കും."
                ),
            ]
        ),
        Topic(
            name: "Depression",
            verses: [
                Verse(
                    reference: "Psalm 34:18",
                    web: "The LORD is near to those who have a broken heart, and saves those who have a crushed spirit.",
                    malayalam: "ഹൃദയം നുറുങ്ങിയവര്‍ക്കു യഹോവ സമീപസ്ഥന്‍; മനസ്സ് തകര്‍ന്നവരെ അവന്‍ രക്ഷിക്കുന്നു."
                ),
                Verse(
                    reference: "Psalm 42:11",
                    web: "Why are you in despair, my soul? Why are you disturbed within me? Hope in God! For I shall still praise him, the saving help of my countenance, and my God.",
                    malayalam: "എന്‍റെ ആത്മാവേ, നീ വിഷാദിച്ച് ഉള്ളിൽ ഞരങ്ങുന്നത് എന്ത്? ദൈവത്തിൽ പ്രത്യാശവയ്ക്കുക; അവന്‍ എന്‍റെ മുഖപ്രകാശകരക്ഷയും എന്‍റെ ദൈവവുമാകുന്നു എന്നിങ്ങനെ ഞാന്‍ ഇനിയും അവനെ സ്തുതിക്കും."
                ),
                Verse(
                    reference: "Psalm 40:1-2",
                    web: "I waited patiently for the LORD. He turned to me, and heard my cry. He brought me up also out of a horrible pit, out of the miry clay. He set my feet on a rock, and gave me a firm place to stand.",
                    malayalam: "ഞാന്‍ യഹോവയ്ക്കായി കാത്തുകാത്തിരുന്നു; അവന്‍ എങ്കലേക്കു ചാഞ്ഞ് എന്‍റെ നിലവിളി കേട്ടു. നാശകരമായ കുഴിയിൽനിന്നും കുഴഞ്ഞ ചേറ്റിൽനിന്നും അവന്‍ എന്നെ കയറ്റി; എന്‍റെ കാലുകളെ ഒരു പാറമേൽ നിര്‍ത്തി, എന്‍റെ ഗമനത്തെ സ്ഥിരമാക്കി."
                ),
                Verse(
                    reference: "Psalm 30:5",
                    web: "Weeping may stay for the night, but joy comes in the morning.",
                    malayalam: "അവന്‍റെ കോപം ക്ഷണനേരത്തേക്കേയുള്ളൂ; അവന്‍റെ പ്രസാദമോ ജീവപര്യന്തമുള്ളത്; സന്ധ്യയിങ്കൽ കരച്ചൽ വന്നു രാപാര്‍ക്കും; ഉഷസ്സിലോ ആനന്ദഘോഷം വരുന്നു."
                ),
                Verse(
                    reference: "Isaiah 61:3",
                    web: "to provide for those who mourn in Zion, to give to them a garland for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness.",
                    malayalam: "സീയോനിലെ ദുഃഖിതന്മാര്‍ക്കു വെണ്ണീറിനു പകരം അലങ്കാരമാലയും ദുഃഖത്തിനു പകരം ആനന്ദതൈലവും വിഷണ്ണമനസ്സിനു പകരം സ്തുതി എന്ന മേലാടയും കൊടുപ്പാനും അവന്‍ എന്നെ അയച്ചിരിക്കുന്നു; അവന്‍ മഹത്ത്വീകരിക്കപ്പെടേണ്ടതിന് അവര്‍ക്കു നീതിവൃക്ഷങ്ങള്‍ എന്നും യഹോവയുടെ നടുതല എന്നും പേരാകും."
                ),
            ]
        ),
        Topic(
            name: "Faith",
            verses: [
                Verse(
                    reference: "2 Corinthians 5:7",
                    web: "for we walk by faith, not by sight.",
                    malayalam: "കാഴ്ചയാല്‍ അല്ല വിശ്വാസത്താലത്രേ ഞങ്ങള്‍ നടക്കുന്നത്."
                ),
                Verse(
                    reference: "Mark 11:24",
                    web: "Therefore I tell you, all things whatever you pray and ask for, believe that you have received them, and you shall have them.",
                    malayalam: "അതുകൊണ്ടു നിങ്ങള്‍ പ്രാര്‍ഥിക്കുമ്പോള്‍ യാചിക്കുന്നതൊക്കെയും ലഭിച്ചു എന്നു വിശ്വസിപ്പിന്‍; എന്നാല്‍ അതു നിങ്ങള്‍ക്ക് ഉണ്ടാകും എന്നു ഞാന്‍ നിങ്ങളോടു പറയുന്നു."
                ),
                Verse(
                    reference: "Matthew 17:20",
                    web: "...for most certainly I tell you, if you have faith as a grain of mustard seed, you will tell this mountain, ‘Move from here to there,’ and it will move; and nothing will be impossible for you.",
                    malayalam: "അവന്‍ അവരോട്: നിങ്ങളുടെ അല്പവിശ്വാസം നിമിത്തമത്രേ; നിങ്ങള്‍ക്കു കടുകുമണിയോളം വിശ്വാസമുണ്ടെങ്കില്‍ ഈ മലയോട്: ഇവിടെനിന്ന് അങ്ങോട്ടു നീങ്ങുക എന്നു പറഞ്ഞാല്‍ അതു നീങ്ങും; നിങ്ങള്‍ക്ക് ഒന്നും അസാധ്യമാകയുമില്ല. എന്നു ഞാന്‍ സത്യമായിട്ടു നിങ്ങളോടു പറയുന്നു എന്നു പറഞ്ഞു."
                ),
                Verse(
                    reference: "Ephesians 2:8",
                    web: "for by grace you have been saved through faith, and that not of yourselves; it is the gift of God.",
                    malayalam: "കൃപയാലല്ലോ നിങ്ങള്‍ വിശ്വാസംമൂലം രക്ഷിക്കപ്പെട്ടിരിക്കുന്നത്; അതിനും നിങ്ങള്‍ കാരണമല്ല; ദൈവത്തിന്‍റെ ദാനമത്രേയാകുന്നു."
                ),
            ]
        ),
        Topic(
            name: "Fear",
            verses: [
                Verse(
                    reference: "Isaiah 41:10",
                    web: "Don’t you be afraid, for I am with you. Don’t be dismayed, for I am your God. I will strengthen you. Yes, I will help you. Yes, I will uphold you with the right hand of my righteousness.",
                    malayalam: "നീ ഭയപ്പെടേണ്ടാ; ഞാന്‍ നിന്നോടുകൂടെ ഉണ്ട്; ഭ്രമിച്ചുനോക്കേണ്ടാ, ഞാന്‍ നിന്‍റെ ദൈവം ആകുന്നു; ഞാന്‍ നിന്നെ ശക്തീകരിക്കും; ഞാന്‍ നിന്നെ സഹായിക്കും; എന്‍റെ നീതിയുള്ള വലംകൈകൊണ്ടു ഞാന്‍ നിന്നെ താങ്ങും,"
                ),
                Verse(
                    reference: "Joshua 1:9",
                    web: "Haven’t I commanded you? Be strong and courageous. Don’t be afraid. Don’t be dismayed, for the LORD your God is with you wherever you go.",
                    malayalam: "നിന്‍റെ ദൈവമായ യഹോവ നീ പോകുന്നേടത്തൊക്കെയും നിന്നോടുകൂടെ ഉള്ളതുകൊണ്ട് ഉറപ്പും ധൈര്യവുമുള്ളവനായിരിക്ക; ഭയപ്പെടരുത്, ഭ്രമിക്കയും അരുത് എന്ന് ഞാന്‍ നിന്നോടു കല്പിച്ചുവല്ലോ."
                ),
                Verse(
                    reference: "Psalm 27:1",
                    web: "The LORD is my light and my salvation. Whom shall I fear? The LORD is the strength of my life. Of whom shall I be afraid?",
                    malayalam: "യഹോവ എന്‍റെ വെളിച്ചവും എന്‍റെ രക്ഷയും ആകുന്നു; ഞാന്‍ ആരെ ഭയപ്പെടും? യഹോവ എന്‍റെ ജീവന്‍റെ ബലം; ഞാന്‍ ആരെ പേടിക്കും?"
                ),
                Verse(
                    reference: "2 Timothy 1:7",
                    web: "For God didn’t give us a spirit of fear, but of power, love, and self-control.",
                    malayalam: "ഭീരുത്വത്തിന്‍റെ ആത്മാവിനെ അല്ല, ശക്തിയുടെയും സ്നേഹത്തിന്‍റെയും സുബോധത്തിന്‍റെയും ആത്മാവിനെയത്രേ ദൈവം നമുക്കു തന്നത്."
                ),
                Verse(
                    reference: "Psalm 56:3",
                    web: "When I am afraid, I will put my trust in you.",
                    malayalam: "ഞാന്‍ ഭയപ്പെടുന്ന നാളിൽ നിന്നിൽ ആശ്രയിക്കും."
                ),
            ]
        ),
        Topic(
            name: "Forgiveness",
            verses: [
                Verse(
                    reference: "1 John 1:9",
                    web: "If we confess our sins, he is faithful and righteous to forgive us the sins, and to cleanse us from all unrighteousness.",
                    malayalam: "നമ്മുടെ പാപങ്ങളെ ഏറ്റുപറയുന്നു എങ്കില്‍ അവന്‍ നമ്മോടു പാപങ്ങളെ ക്ഷമിച്ചു സകല അനീതിയും പോക്കി നമ്മെ ശുദ്ധീകരിപ്പാന്‍ തക്കവണ്ണം വിശ്വസ്തനും നീതിമാനും ആകുന്നു."
                ),
                Verse(
                    reference: "Ephesians 4:32",
                    web: "And be kind to one another, tender hearted, forgiving each other, just as God also in Christ forgave you.",
                    malayalam: "നിങ്ങള്‍ തമ്മില്‍ ദയയും മനസ്സലിവുമുള്ളവരായി ദൈവം ക്രിസ്തുവില്‍ നിങ്ങളോടു ക്ഷമിച്ചതുപോലെ അന്യോന്യം ക്ഷമിപ്പിന്‍."
                ),
                Verse(
                    reference: "Colossians 3:13",
                    web: "bearing with one another, and forgiving each other, if any man has a complaint against any; even as Christ forgave you, so you also do.",
                    malayalam: "ഒരുവനോടു ഒരുവന് വഴക്കുണ്ടായാല്‍ തമ്മില്‍ ക്ഷമിക്കയും ചെയ്‍വിന്‍; കര്‍ത്താവു നിങ്ങളോടു ക്ഷമിച്ചതുപോലെ നിങ്ങളും ചെയ്‍വിന്‍."
                ),
                Verse(
                    reference: "Psalm 103:12",
                    web: "As far as the east is from the west, so far has he removed our transgressions from us.",
                    malayalam: "ഉദയം അസ്തമയത്തോട് അകന്നിരിക്കുന്നതുപോലെ അവന്‍ നമ്മുടെ ലംഘനങ്ങളെ നമ്മോട് അകറ്റിയിരിക്കുന്നു."
                ),
                Verse(
                    reference: "Micah 7:19",
                    web: "He will again have compassion on us. He will tread our iniquities under foot; and you will cast all their sins into the depths of the sea.",
                    malayalam: "അവന്‍ നമ്മോടു വീണ്ടും കരുണ കാണിക്കും; നമ്മുടെ അകൃത്യങ്ങളെ ചവിട്ടിക്കളയും; അവരുടെ പാപങ്ങളെയൊക്കെയും നീ സമുദ്രത്തിന്‍റെ ആഴത്തിൽ ഇട്ടുകളയും."
                ),
            ]
        ),
        Topic(
            name: "Gratitude",
            verses: [
                Verse(
                    reference: "1 Thessalonians 5:16-18",
                    web: "Always rejoice. Pray without ceasing. In everything give thanks, for this is the will of God in Christ Jesus toward you.",
                    malayalam: "എപ്പോഴും സന്തോഷിപ്പിന്‍; ഇടവിടാതെ പ്രാര്‍ഥിപ്പിന്‍; എല്ലാറ്റിനും സ്തോത്രം ചെയ്‍വിന്‍; ഇതല്ലോ നിങ്ങളെക്കുറിച്ചു ക്രിസ്തുയേശുവില്‍ ദൈവേഷ്ടം."
                ),
                Verse(
                    reference: "Psalm 107:1",
                    web: "Give thanks to the LORD, for he is good, for his loving kindness endures forever.",
                    malayalam: "യഹോവയ്ക്കു സ്തോത്രം ചെയ്‍വിന്‍; അവന്‍ നല്ലവനല്ലോ അവന്‍റെ ദയ എന്നേക്കുമുള്ളത്!"
                ),
                Verse(
                    reference: "Psalm 118:24",
                    web: "This is the day that the LORD has made. We will rejoice and be glad in it!",
                    malayalam: "ഇതു യഹോവ ഉണ്ടാക്കിയ ദിവസം; ഇന്നു നാം സന്തോഷിച്ച് ആനന്ദിക്ക."
                ),
            ]
        ),
        Topic(
            name: "Guidance",
            verses: [
                Verse(
                    reference: "Proverbs 3:5-6",
                    web: "Trust in the LORD with all your heart, and don’t lean on your own understanding. In all your ways acknowledge him, and he will make your paths straight.",
                    malayalam: "പൂര്‍ണഹൃദയത്തോടെ യഹോവയിൽ ആശ്രയിക്ക; സ്വന്ത വിവേകത്തിൽ ഊന്നരുത്. നിന്‍റെ എല്ലാവഴികളിലും അവനെ നിനച്ചുകൊള്‍ക; അവന്‍ നിന്‍റെ പാതകളെ നേരേയാക്കും;"
                ),
                Verse(
                    reference: "Psalm 32:8",
                    web: "I will instruct you and teach you in the way which you shall go. I will counsel you with my eye on you.",
                    malayalam: "ഞാന്‍ നിന്നെ ഉപദേശിച്ച്, നടക്കേണ്ടുന്ന വഴി നിനക്കു കാണിച്ചുതരും; ഞാന്‍ നിന്‍റെമേൽ ദൃഷ്‍ടിവച്ച് നിനക്ക് ആലോചന പറഞ്ഞുതരും."
                ),
                Verse(
                    reference: "Psalm 119:105",
                    web: "Your word is a lamp to my feet, and a light for my path.",
                    malayalam: "നിന്‍റെ വചനം എന്‍റെ കാലിനു ദീപവും എന്‍റെ പാതയ്ക്കു പ്രകാശവും ആകുന്നു."
                ),
                Verse(
                    reference: "Isaiah 30:21",
                    web: "and when you turn to the right hand, and when you turn to the left, your ears will hear a voice behind you, saying, “This is the way. Walk in it.”",
                    malayalam: "നിങ്ങള്‍ വലത്തോട്ടോ ഇടത്തോട്ടോ തിരിയുമ്പോള്‍: വഴി ഇതാകുന്നു, ഇതിൽ നടന്നുകൊള്‍വിന്‍ എന്നൊരു വാക്ക് പിറകിൽനിന്നു കേള്‍ക്കും."
                ),
                Verse(
                    reference: "James 1:5",
                    web: "But if any of you lacks wisdom, let him ask of God, who gives to all liberally and without reproach, and it will be given to him.",
                    malayalam: "നിങ്ങളില്‍ ഒരുത്തനു ജ്ഞാനം കുറവാകുന്നു എങ്കില്‍ ഭര്‍ത്സിക്കാതെ എല്ലാവര്‍ക്കും ഔദാര്യമായി കൊടുക്കുന്നവനായ ദൈവത്തോടു യാചിക്കട്ടെ; അപ്പോള്‍ അവനു ലഭിക്കും."
                ),
            ]
        ),
        Topic(
            name: "Healing",
            verses: [
                Verse(
                    reference: "Jeremiah 17:14",
                    web: "Heal me, O LORD, and I will be healed. Save me, and I will be saved; for you are my praise.",
                    malayalam: "യഹോവേ, എന്നെ സൗഖ്യമാക്കേണമേ, എന്നാൽ എനിക്കു സൗഖ്യം വരും; എന്നെ രക്ഷിക്കേണമേ, എന്നാൽ ഞാന്‍ രക്ഷപെടും; നീ എന്‍റെ പുകഴ്ചയല്ലോ."
                ),
                Verse(
                    reference: "Psalm 147:3",
                    web: "He heals the broken in heart, and binds up their wounds.",
                    malayalam: "മനം തകര്‍ന്നവരെ അവന്‍ സൗഖ്യമാക്കുകയും അവരുടെ മുറിവുകളെ കെട്ടുകയും ചെയ്യുന്നു."
                ),
                Verse(
                    reference: "1 Peter 2:24",
                    web: "...by whose stripes you were healed.",
                    malayalam: "നാം പാപം സംബന്ധിച്ചു മരിച്ചു നീതിക്കു ജീവിക്കേണ്ടതിന് അവന്‍ തന്‍റെ ശരീരത്തില്‍ നമ്മുടെ പാപങ്ങളെ ചുമന്നുകൊണ്ടു ക്രൂശിന്മേല്‍ കയറി; അവന്‍റെ അടിപ്പിണരാല്‍ നിങ്ങള്‍ക്കു സൗഖ്യം വന്നിരിക്കുന്നു."
                ),
                Verse(
                    reference: "Psalm 103:2-3",
                    web: "Praise the LORD, my soul, and don’t forget all his benefits, who forgives all your sins, who heals all your diseases,",
                    malayalam: "എന്‍ മനമേ, യഹോവയെ വാഴ്ത്തുക; അവന്‍റെ ഉപകാരങ്ങള്‍ ഒന്നും മറക്കരുത്. അവന്‍ നിന്‍റെ അകൃത്യമൊക്കെയും മോചിക്കുന്നു; നിന്‍റെ സകല രോഗങ്ങളെയും സൗഖ്യമാക്കുന്നു;"
                ),
                Verse(
                    reference: "James 5:15",
                    web: "and the prayer of faith will heal him who is sick, and the Lord will raise him up. If he has committed sins, he will be forgiven.",
                    malayalam: "എന്നാല്‍ വിശ്വാസത്തോടുകൂടിയ പ്രാര്‍ഥന ദീനക്കാരനെ രക്ഷിക്കും; കര്‍ത്താവ് അവനെ എഴുന്നേല്പിക്കും; അവന്‍ പാപം ചെയ്തിട്ടുണ്ടെങ്കില്‍ അവനോടു ക്ഷമിക്കും."
                ),
            ]
        ),
        Topic(
            name: "Hope",
            verses: [
                Verse(
                    reference: "Jeremiah 29:11",
                    web: "For I know the thoughts that I think toward you, says the LORD, thoughts of peace, and not of evil, to give you hope and a future.",
                    malayalam: "നിങ്ങള്‍ പ്രത്യാശിക്കുന്ന ശുഭഭാവി വരുവാന്‍ തക്കവണ്ണം ഞാന്‍ നിങ്ങളെക്കുറിച്ചു നിരൂപിക്കുന്ന നിരൂപണങ്ങള്‍ ഇന്നവ എന്നു ഞാന്‍ അറിയുന്നു; അവ തിന്മയ്ക്കല്ല നന്മയ്ക്കത്രേയുള്ള നിരൂപണങ്ങള്‍ എന്നു യഹോവയുടെ അരുളപ്പാട്."
                ),
                Verse(
                    reference: "Romans 15:13",
                    web: "Now may the God of hope fill you with all joy and peace in believing, that you may abound in hope, in the power of the Holy Spirit.",
                    malayalam: "എന്നാല്‍ പ്രത്യാശ നല്കുന്ന ദൈവം പരിശുദ്ധാത്മാവിന്‍റെ ശക്തിയാല്‍ നിങ്ങള്‍ പ്രത്യാശയില്‍ സമൃദ്ധിയുള്ളവരായി വിശ്വസിക്കുന്നതിലുള്ള സകല സന്തോഷവും സമാധാനവുംകൊണ്ടു നിങ്ങളെ നിറയ്ക്കുമാറാകട്ടെ."
                ),
                Verse(
                    reference: "Lamentations 3:22-23",
                    web: "It is because of the LORD’s loving kindnesses that we are not consumed, because his compassion doesn’t fail. They are new every morning. Great is your faithfulness.",
                    malayalam: "നാം മുടിഞ്ഞുപോകാതിരിക്കുന്നത് യഹോവയുടെ ദയ ആകുന്നു; അവന്‍റെ കരുണ തീര്‍ന്നുപോയിട്ടില്ലല്ലോ; അതു രാവിലെതോറും പുതിയതും നിന്‍റെ വിശ്വസ്തത വലിയതും ആകുന്നു."
                ),
                Verse(
                    reference: "Hebrews 11:1",
                    web: "Now faith is assurance of things hoped for, proof of things not seen.",
                    malayalam: "വിശ്വാസം എന്നതോ, ആശിക്കുന്നതിന്‍റെ ഉറപ്പും കാണാത്ത കാര്യങ്ങളുടെ നിശ്ചയവും ആകുന്നു."
                ),
                Verse(
                    reference: "Romans 8:28",
                    web: "We know that all things work together for good for those who love God, for those who are called according to his purpose.",
                    malayalam: "എന്നാല്‍ ദൈവത്തെ സ്നേഹിക്കുന്നവര്‍ക്ക്, നിര്‍ണയപ്രകാരം വിളിക്കപ്പെട്ടവര്‍ക്കുതന്നെ, സകലവും നന്മയ്ക്കായി കൂടി വ്യാപരിക്കുന്നു എന്നു നാം അറിയുന്നു."
                ),
            ]
        ),
        Topic(
            name: "Loneliness",
            verses: [
                Verse(
                    reference: "Hebrews 13:5",
                    web: "...for he has said, “I will in no way leave you, neither will I in any way forsake you.”",
                    malayalam: "നിങ്ങളുടെ നടപ്പ് ദ്രവ്യാഗ്രഹമില്ലാത്തതായിരിക്കട്ടെ; ഉള്ളതുകൊണ്ടു തൃപ്തിപ്പെടുവിന്‍; “ഞാന്‍ നിന്നെ ഒരു നാളും കൈവിടുകയില്ല, ഉപേക്ഷിക്കയുമില്ല” എന്ന് അവന്‍തന്നെ അരുളിച്ചെയ്തിരിക്കുന്നുവല്ലോ."
                ),
                Verse(
                    reference: "Psalm 139:7-10",
                    web: "Where could I go from your Spirit? Or where could I flee from your presence? ...even there your hand will lead me, and your right hand will hold me.",
                    malayalam: "നിന്‍റെ ആത്മാവിനെ ഒളിച്ചു ഞാന്‍ എവിടേക്കു പോകും? തിരുസന്നിധിവിട്ടു ഞാന്‍ എവിടേക്ക് ഓടും? ഞാന്‍ സ്വര്‍ഗത്തിൽ കയറിയാൽ നീ അവിടെ ഉണ്ട്; പാതാളത്തിൽ എന്‍റെ കിടക്ക വിരിച്ചാൽ നീ അവിടെ ഉണ്ട്. ഞാന്‍ ഉഷസ്സിന്‍ചിറകു ധരിച്ച്, സമുദ്രത്തിന്‍റെ അറ്റത്തുചെന്നു പാര്‍ത്താൽ അവിടെയും നിന്‍റെ കൈ എന്നെ നടത്തും; നിന്‍റെ വലംകൈ എന്നെ പിടിക്കും."
                ),
                Verse(
                    reference: "Matthew 28:20",
                    web: "...Behold, I am with you always, even to the end of the age.",
                    malayalam: "ഞാന്‍ നിങ്ങളോടു കല്പിച്ചതൊക്കെയും പ്രമാണിപ്പാന്‍ തക്കവണ്ണം ഉപദേശിച്ചുംകൊണ്ടു സകല ജാതികളെയും ശിഷ്യരാക്കിക്കൊള്‍വിന്‍; ഞാനോ ലോകാവസാനത്തോളം എല്ലാ നാളും നിങ്ങളോടുകൂടെ ഉണ്ട് എന്ന് അരുളിച്ചെയ്തു."
                ),
                Verse(
                    reference: "Deuteronomy 31:6",
                    web: "Be strong and courageous. Don’t be afraid or scared of them; for the LORD your God himself is who goes with you. He will not fail you nor forsake you.",
                    malayalam: "ബലവും ധൈര്യവുമുള്ളവരായിരിപ്പിന്‍; അവരെ പേടിക്കരുത്, ഭ്രമിക്കയുമരുത്; നിന്‍റെ ദൈവമായ യഹോവതന്നെ നിന്നോടുകൂടെ പോരുന്നു; അവന്‍ നിന്നെ കൈവിടുകയില്ല, ഉപേക്ഷിക്കയുമില്ല."
                ),
            ]
        ),
        Topic(
            name: "Love",
            verses: [
                Verse(
                    reference: "John 3:16",
                    web: "For God so loved the world, that he gave his one and only Son, that whoever believes in him should not perish, but have eternal life.",
                    malayalam: "തന്‍റെ ഏകജാതനായ പുത്രനില്‍ വിശ്വസിക്കുന്ന ഏവനും നശിച്ചുപോകാതെ നിത്യജീവന്‍ പ്രാപിക്കേണ്ടതിന് ദൈവം അവനെ നല്കുവാന്‍ തക്കവണ്ണം ലോകത്തെ സ്നേഹിച്ചു."
                ),
                Verse(
                    reference: "Romans 8:38-39",
                    web: "For I am persuaded that neither death, nor life, nor angels, nor principalities, nor things present, nor things to come, nor powers, nor height, nor depth, nor any other created thing will be able to separate us from God’s love which is in Christ Jesus our Lord.",
                    malayalam: "മരണത്തിനോ ജീവനോ ദൂതന്മാര്‍ക്കോ വാഴ്ചകള്‍ക്കോ അധികാരങ്ങള്‍ക്കോ ഇപ്പോഴുള്ളതിനോ വരുവാനുള്ളതിനോ ഉയരത്തിനോ ആഴത്തിനോ മറ്റു യാതൊരു സൃഷ്ടിക്കോ നമ്മുടെ കര്‍ത്താവായ യേശുക്രിസ്തുവിലുള്ള ദൈവസ്നേഹത്തില്‍നിന്നു നമ്മെ വേര്‍പിരിപ്പാന്‍ കഴികയില്ല എന്നു ഞാന്‍ ഉറച്ചിരിക്കുന്നു."
                ),
                Verse(
                    reference: "1 Corinthians 13:4-5",
                    web: "Love is patient and is kind. Love doesn’t envy. Love doesn’t brag, is not proud, doesn’t behave itself inappropriately, doesn’t seek its own way, is not provoked, takes no account of evil.",
                    malayalam: "സ്നേഹം ദീര്‍ഘമായി ക്ഷമിക്കയും ദയ കാണിക്കയും ചെയ്യുന്നു; സ്നേഹം സ്പര്‍ധിക്കുന്നില്ല. സ്നേഹം നിഗളിക്കുന്നില്ല. ചീര്‍ക്കുന്നില്ല; അയോഗ്യമായി നടക്കുന്നില്ല സ്വാര്‍ഥം അന്വേഷിക്കുന്നില്ല, ദ്വേഷ്യപ്പെടുന്നില്ല, ദോഷം കണക്കിടുന്നില്ല;"
                ),
                Verse(
                    reference: "1 John 4:18",
                    web: "There is no fear in love; but perfect love casts out fear, because fear has punishment. He who fears is not made perfect in love.",
                    malayalam: "സ്നേഹത്തില്‍ ഭയമില്ല; ഭയത്തിനു ദണ്ഡനം ഉള്ളതിനാല്‍ തികഞ്ഞ സ്നേഹം ഭയത്തെ പുറത്താക്കിക്കളയുന്നു; ഭയപ്പെടുന്നവന്‍ സ്നേഹത്തില്‍ തികഞ്ഞവനല്ല."
                ),
                Verse(
                    reference: "Zephaniah 3:17",
                    web: "The LORD, your God, is among you, a mighty one who will save. He will rejoice over you with joy. He will calm you in his love. He will rejoice over you with singing.",
                    malayalam: "നിന്‍റെ ദൈവമായ യഹോവ രക്ഷിക്കുന്ന വീരനായി നിന്‍റെ മധ്യേ ഇരിക്കുന്നു; അവന്‍ നിന്നിൽ അത്യന്തം സന്തോഷിക്കും; തന്‍റെ സ്നേഹത്തിൽ അവന്‍ മിണ്ടാതിരിക്കുന്നു; ഘോഷത്തോടെ അവന്‍ നിങ്കൽ ആനന്ദിക്കും."
                ),
            ]
        ),
        Topic(
            name: "Peace",
            verses: [
                Verse(
                    reference: "John 14:27",
                    web: "Peace I leave with you. My peace I give to you; not as the world gives, I give to you. Don’t let your heart be troubled, neither let it be fearful.",
                    malayalam: "സമാധാനം ഞാന്‍ നിങ്ങള്‍ക്കു തന്നേച്ചുപോകുന്നു; എന്‍റെ സമാധാനം ഞാന്‍ നിങ്ങള്‍ക്കു തരുന്നു; ലോകം തരുന്നതുപോലെ അല്ല ഞാന്‍ നിങ്ങള്‍ക്കു തരുന്നത്. നിങ്ങളുടെ ഹൃദയം കലങ്ങരുത്, ഭ്രമിക്കയും അരുത്."
                ),
                Verse(
                    reference: "Numbers 6:24-26",
                    web: "The LORD bless you, and keep you. The LORD make his face to shine on you, and be gracious to you. The LORD lift up his face toward you, and give you peace.",
                    malayalam: "യഹോവ നിന്നെ അനുഗ്രഹിച്ചു കാക്കുമാറാകട്ടെ; യഹോവ തിരുമുഖം നിന്‍റെമേൽ പ്രകാശിപ്പിച്ചു നിന്നോടു കൃപയുള്ളവനാകട്ടെ; യഹോവ തിരുമുഖം നിന്‍റെമേൽ ഉയര്‍ത്തി നിനക്കു സമാധാനം നല്കുമാറാകട്ടെ."
                ),
                Verse(
                    reference: "Colossians 3:15",
                    web: "And let the peace of God rule in your hearts, to which also you were called in one body, and be thankful.",
                    malayalam: "ക്രിസ്തുവിന്‍റെ സമാധാനം നിങ്ങളുടെ ഹൃദയങ്ങളില്‍ വാഴട്ടെ; അതിനല്ലോ നിങ്ങള്‍ ഏകശരീരമായി വിളിക്കപ്പെട്ടുമിരിക്കുന്നത്; നന്ദിയുള്ളവരായും ഇരിപ്പിന്‍."
                ),
                Verse(
                    reference: "Psalm 4:8",
                    web: "In peace I will both lay myself down and sleep, for you, LORD alone, make me live in safety.",
                    malayalam: "ഞാന്‍ സമാധാനത്തോടെ കിടന്നുറങ്ങും; നീയല്ലോ യഹോവേ, എന്നെ നിര്‍ഭയം വസിക്കുമാറാക്കുന്നത്."
                ),
                Verse(
                    reference: "Psalm 46:10",
                    web: "Be still, and know that I am God. I will be exalted among the nations. I will be exalted in the earth.",
                    malayalam: "മിണ്ടാതിരുന്നു, ഞാന്‍ ദൈവമെന്ന് അറിഞ്ഞുകൊള്‍വിന്‍; ഞാന്‍ ജാതികളുടെ ഇടയിൽ ഉന്നതന്‍ ആകും; ഞാന്‍ ഭൂമിയിൽ ഉന്നതന്‍ ആകും."
                ),
            ]
        ),
        Topic(
            name: "Salvation",
            verses: [
                Verse(
                    reference: "Acts 4:12",
                    web: "There is salvation in none other, for neither is there any other name under heaven that is given among men, by which we must be saved!",
                    malayalam: "മറ്റൊരുത്തനിലും രക്ഷ ഇല്ല; നാം രക്ഷിക്കപ്പെടുവാന്‍ ആകാശത്തിന്‍കീഴില്‍ മനുഷ്യരുടെ ഇടയില്‍ നല്കപ്പെട്ട വേറൊരു നാമവും ഇല്ല."
                ),
                Verse(
                    reference: "2 Corinthians 5:10",
                    web: "For we must all be revealed before the judgment seat of Christ; that each one may receive the things in the body, according to what he has done, whether good or bad.",
                    malayalam: "അവനവന്‍ ശരീരത്തില്‍ ഇരിക്കുമ്പോള്‍ ചെയ്തതു നല്ലതാകിലും തീയതാകിലും അതിനു തക്കവണ്ണം പ്രാപിക്കേണ്ടതിനു നാം എല്ലാവരും ക്രിസ്തുവിന്‍റെ ന്യായാസനത്തിന്‍റെ മുമ്പാകെ വെളിപ്പെടേണ്ടതാകുന്നു."
                ),
            ]
        ),
        Topic(
            name: "Strength",
            verses: [
                Verse(
                    reference: "Philippians 4:13",
                    web: "I can do all things through Christ, who strengthens me.",
                    malayalam: "എന്നെ ശക്തനാക്കുന്നവന്‍ മുഖാന്തരം ഞാന്‍ സകലത്തിനും മതിയാകുന്നു."
                ),
                Verse(
                    reference: "Isaiah 40:31",
                    web: "but those who wait for the LORD will renew their strength. They will mount up with wings like eagles. They will run, and not be weary. They will walk, and not faint.",
                    malayalam: "എങ്കിലും യഹോവയെ കാത്തിരിക്കുന്നവര്‍ ശക്തിയെ പുതുക്കും; അവര്‍ കഴുകന്മാരെപ്പോലെ ചിറക് അടിച്ചു കയറും; അവര്‍ തളര്‍ന്നുപോകാതെ ഓടുകയും ക്ഷീണിച്ചുപോകാതെ നടക്കുകയും ചെയ്യും."
                ),
                Verse(
                    reference: "Psalm 28:7",
                    web: "The LORD is my strength and my shield. My heart has trusted in him, and I am helped. Therefore my heart greatly rejoices. With my song I will thank him.",
                    malayalam: "യഹോവ എന്‍റെ ബലവും എന്‍റെ പരിചയും ആകുന്നു; എന്‍റെ ഹൃദയം അവങ്കൽ ആശ്രയിച്ചു; എനിക്ക് സഹായവും ലഭിച്ചു; അതുകൊണ്ട് എന്‍റെ ഹൃദയം ഉല്ലസിക്കുന്നു; പാട്ടോടെ ഞാന്‍ അവനെ സ്തുതിക്കുന്നു."
                ),
                Verse(
                    reference: "2 Corinthians 12:9",
                    web: "He has said to me, “My grace is sufficient for you, for my power is made perfect in weakness.” Most gladly therefore I will rather glory in my weaknesses, that the power of Christ may rest on me.",
                    malayalam: "അവന്‍ എന്നോട്: എന്‍റെ കൃപ നിനക്കുമതി; എന്‍റെ ശക്തി ബലഹീനതയില്‍ തികഞ്ഞുവരുന്നു എന്നു പറഞ്ഞു. ആകയാല്‍ ക്രിസ്തുവിന്‍റെ ശക്തി എന്‍റെമേല്‍ ആവസിക്കേണ്ടതിനു ഞാന്‍ അതിസന്തോഷത്തോടെ എന്‍റെ ബലഹീനതകളില്‍ പ്രശംസിക്കും."
                ),
                Verse(
                    reference: "Nehemiah 8:10",
                    web: "...for the joy of the LORD is your strength.",
                    malayalam: "അനന്തരം അവന്‍ അവരോട്: നിങ്ങള്‍ ചെന്നു മൃഷ്ടാന്നഭോജനവും മധുരപാനീയവും കഴിച്ചു തങ്ങള്‍ക്കായി വട്ടംകൂട്ടിയിട്ടില്ലാത്തവര്‍ക്കു പകര്‍ച്ച കൊടുത്തയപ്പിന്‍; ഈ ദിവസം നമ്മുടെ കര്‍ത്താവിനു വിശുദ്ധമാകുന്നു; നിങ്ങള്‍ ദുഃഖിക്കരുത്; യഹോവയിങ്കലെ സന്തോഷം നിങ്ങളുടെ ബലം ആകുന്നുവല്ലോ എന്നു പറഞ്ഞു."
                ),
                Verse(
                    reference: "Psalm 27:14",
                    web: "Wait for the LORD. Be strong, and let your heart take courage. Yes, wait for the LORD.",
                    malayalam: "യഹോവയിങ്കൽ പ്രത്യാശവയ്ക്കുക; ധൈര്യപ്പെട്ടിരിക്ക; നിന്‍റെ ഹൃദയം ഉറച്ചിരിക്കട്ടെ; അതേ, യഹോവയിങ്കൽ പ്രത്യാശവയ്ക്കുക."
                ),
                Verse(
                    reference: "Psalm 119:165",
                    web: "Those who love your law have great peace. Nothing causes them to stumble.",
                    malayalam: "നിന്‍റെ ന്യായപ്രമാണത്തോടു പ്രിയം ഉള്ളവര്‍ക്കു മഹാസമാധാനം ഉണ്ട്; അവര്‍ക്കു വീഴ്ചയ്ക്കു സംഗതി ഏതുമില്ല."
                ),
            ]
        ),
        Topic(
            name: "Trust",
            verses: [
                Verse(
                    reference: "Psalm 23:1",
                    web: "The LORD is my shepherd; I shall lack nothing.",
                    malayalam: "യഹോവ എന്‍റെ ഇടയനാകുന്നു; എനിക്കു മുട്ടുണ്ടാകയില്ല."
                ),
                Verse(
                    reference: "Psalm 16:8",
                    web: "I have set the LORD always before me. Because he is at my right hand, I shall not be moved.",
                    malayalam: "ഞാന്‍ യഹോവയെ എപ്പോഴും എന്‍റെ മുമ്പിൽ വച്ചിരിക്കുന്നു. അവന്‍ എന്‍റെ വലത്തുഭാഗത്തുള്ളതുകൊണ്ട് ഞാന്‍ കുലുങ്ങിപ്പോകയില്ല."
                ),
                Verse(
                    reference: "Psalm 37:4",
                    web: "Also delight yourself in the LORD, and he will give you the desires of your heart.",
                    malayalam: "യഹോവയിൽ തന്നെ രസിച്ചുകൊള്‍ക; അവന്‍ നിന്‍റെ ഹൃദയത്തിലെ ആഗ്രഹങ്ങളെ നിനക്കു തരും."
                ),
                Verse(
                    reference: "Psalm 121:1-2",
                    web: "I will lift up my eyes to the hills. Where does my help come from? My help comes from the LORD, who made heaven and earth.",
                    malayalam: "ഞാന്‍ എന്‍റെ കണ്ണ് പര്‍വതങ്ങളിലേക്ക് ഉയര്‍ത്തുന്നു; എനിക്കു സഹായം എവിടെനിന്നു വരും? എന്‍റെ സഹായം ആകാശത്തെയും ഭൂമിയെയും ഉണ്ടാക്കിയ യഹോവയിങ്കൽനിന്നു വരുന്നു."
                ),
                Verse(
                    reference: "Proverbs 18:10",
                    web: "The name of the LORD is a strong tower: the righteous run to him, and are safe.",
                    malayalam: "യഹോവയുടെ നാമം ബലമുള്ള ഗോപുരം; നീതിമാന്‍ അതിലേക്ക് ഓടിച്ചെന്ന് അഭയം പ്രാപിക്കുന്നു."
                ),
                Verse(
                    reference: "Psalm 73:26",
                    web: "My flesh and my heart fails, but God is the strength of my heart and my portion forever.",
                    malayalam: "എന്‍റെ മാംസവും ഹൃദയവും ക്ഷയിച്ചുപോകുന്നു; ദൈവം എന്നേക്കും എന്‍റെ ഹൃദയത്തിന്‍റെ പാറയും എന്‍റെ ഓഹരിയും ആകുന്നു."
                ),
                Verse(
                    reference: "Psalm 34:8",
                    web: "Oh taste and see that the LORD is good. Blessed is the man who takes refuge in him.",
                    malayalam: "യഹോവ നല്ലവന്‍ എന്നു രുചിച്ചറിവിന്‍; അവനെ ശരണം പ്രാപിക്കുന്ന പുരുഷന്‍ ഭാഗ്യവാന്‍."
                ),
            ]
        ),
    ]
}
