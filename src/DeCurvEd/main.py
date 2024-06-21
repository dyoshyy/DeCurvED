import argparse
import subprocess


def run_train_py(args):
    # コマンドの構築
    command = [
        "python",
        "train.py",
        "--gan-type",
        args.gan_model,
        # 他の必要な引数を追加
    ]

    # 条件に応じて追加の引数を設定
    if args.learn_alphas:
        command.extend(["--learn-alphas"])
    if args.learn_gammas:
        command.extend(["--learn-gammas"])
    if args.tensorboard:
        command.extend(["--tensorboard"])
    # 他の引数を追加する場合は、同様にcommandリストにextendメソッドを使用して追加

    # コマンドの実行
    try:
        subprocess.run(command, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error running train.py with {args.gan_model}")
        print(e)


def main():
    parser = argparse.ArgumentParser(
        description="Run train.py with specified GAN model and options"
    )
    parser.add_argument("gan_model", type=str, help="GAN model type")
    parser.add_argument(
        "--learn-alphas", action="store_true", help="Include to learn alphas"
    )
    parser.add_argument(
        "--learn-gammas", action="store_true", help="Include to learn gammas"
    )
    parser.add_argument(
        "--tensorboard", action="store_true", help="Include to use TensorBoard"
    )
    # 他の引数が必要な場合は、ここに追加

    args = parser.parse_args()

    run_train_py(args)


if __name__ == "__main__":
    main()
