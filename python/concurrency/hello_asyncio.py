
import asyncio


async def count():
    print("One")
    await asyncio.sleep(1)
    print("Two")


async def run_count():
    await asyncio.gather(count(), count(), count())


def main():
    import time
    s = time.perf_counter()
    asyncio.run(run_count())
    elapsed = time.perf_counter() - s
    print(f"Executed in {elapsed:0.2f} seconds.")
    pass


if __name__ == '__main__':
    main()
