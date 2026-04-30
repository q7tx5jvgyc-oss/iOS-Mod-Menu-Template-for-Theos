// واجهة موستاش مود - MUSTACHE MOD UI
void DrawMustacheMenu() {
    // تم تغيير اسم المود هنا
    ImGui::Begin("موستاش مود - MUSTACHE MOD"); 

    static bool speed = false;
    if (ImGui::Switch("1. تسريع اللعبه", &speed)) {
        // يتم وضع كود الـ Offset الخاص بالسرعة هنا
    }

    static bool no_shock = false;
    if (ImGui::Switch("2. ازاله الصدمه", &no_shock)) {
        // كود إلغاء تأثير الصدمة
    }

    static bool no_close = false;
    if (ImGui::Switch("3. ازاله المغلق", &no_close)) {
        // كود فتح الخانات المغلقة
    }

    static bool no_tap = false;
    if (ImGui::Switch("4. ازاله تكبيس", &no_tap)) {
        // كود منع التكبيس المزعج
    }

    static bool royal = false;
    if (ImGui::Switch("5. تفعيل رويال", &royal)) {
        // كود تفعيل مميزات الرويال البصرية
    }

    ImGui::Separator(); // خط فاصل للجمالية
    ImGui::Text("Mustache Mod v1.0"); // توقيع المود في الأسفل

    ImGui::End();
}
